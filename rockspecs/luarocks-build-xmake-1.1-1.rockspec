package = "luarocks-build-xmake"
version = "1.1-1"
source = {
    url = "git+https://github.com/xmake-io/luarocks-build-xmake",
    tag = "1.1"
}
description = {
    detailed = [[
luarocks-build-xmake is a luarocks build module based on [xmake](https://github.com/xmake-io/xmake).
]],
    homepage = "https://github.com/xmake-io/luarocks-build-xmake",
    summary = "A luarocks build module based on xmake",
    license = "Apache-2.0"
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {
        ["luarocks.build.xmake"] = "src/xmake.lua"
    },
    copy_directories = {}
}
