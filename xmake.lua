add_rules("mode.debug", "mode.release")

add_requires("lua")
target("example1.hello")
    if is_plat("macosx") then
        set_kind("binary")
        set_filename("hello.so")
        add_ldflags("-bundle", "-undefined dynamic_lookup", {force = true})
    else
        set_kind("shared")
        set_basename("hello")
    end
    set_symbols("none")
    add_files("src/test.c")
    add_packages("lua")
    on_install(function (target)
        local moduledir = path.directory((target:name():gsub('%.', '/')))
        import('target.action.install')(target, {libdir = path.join('lib', moduledir), bindir = path.join('lib', moduledir)})
    end)

