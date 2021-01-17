add_rules("mode.debug", "mode.release")

rule("luarocks.module")
    before_load(function (target)

        -- imports
        import("core.cache.detectcache")
        import("core.project.target", {alias = "project_target"})

        -- set kind
        if target:is_plat("macosx") then
            target:set("kind", "binary")
            target:add("ldflags", "-bundle", "-undefined dynamic_lookup", {force = true})
        else
            target:set("kind", "shared")
        end

        -- set library name
        local modulename = target:name():split('.', {plain = true})
        modulename = modulename[#modulename]
        if target:is_plat("windows", "mingw") then
            target:set("basename", modulename)
        else
            target:set("filename", modulename .. ".so")
        end

        -- export symbols
        if target:is_plat("windows") then
            local exported_name = target:name():gsub("%.", "_")
            exported_name = exported_name:match('^[^%-]+%-(.+)$') or exported_name
            target:add("shflags", "/export:luaopen_" .. exported_name, {force = true})
        else
            target:set("symbols", "none")
        end

        -- find lua library
        local lua = try {function ()
            local result = detectcache:get("luarocks.module.lua")
            if not result then
                local config = os.iorun("luarocks config")
                if config then
                    local LUALIB     = config:match("LUALIB = \"(.-)\"")
                    local LUA_INCDIR = config:match("LUA_INCDIR = \"(.-)\"")
                    local LUA_LIBDIR = config:match("LUA_LIBDIR = \"(.-)\"")
                    if LUALIB and LUA_INCDIR and LUA_LIBDIR then
                        result = result or {}
                        result.links = project_target.linkname(LUALIB)
                        result.linkdirs = {LUA_LIBDIR}
                        result.includedirs = {LUA_INCDIR}
                    end
                    detectcache:set("luarocks.module.lua", result)
                    detectcache:save()
                end
            end
            return result
        end}
        if not lua then
            lua = find_package("lua")
        end
        if lua then
            -- we need not link lua explicitly
            if target:is_plat("macosx", "linux", "bsd") then
                lua.links = nil
            end
            target:add(lua)
        end
    end)
    on_install(function (target)
        local moduledir = path.directory((target:name():gsub('%.', '/')))
        import('target.action.install')(target, {libdir = path.join('lib', moduledir), bindir = path.join('lib', moduledir)})
    end)
rule_end()

target("example1.hello")
    add_rules("luarocks.module")
    add_files("src/test.c")

