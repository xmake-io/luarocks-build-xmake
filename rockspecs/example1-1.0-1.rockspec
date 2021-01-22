package = "example1"
version = "1.0-1"
source = {
    url = "git://github.com/xmake-io/luarocks-build-xmake",
    tag = "example1"
}
dependencies = {
    "lua >= 5.1",
    "luarocks-build-xmake"
}
build = {
    type = "xmake",
    variables = {
        xmake = {
            version = "2.5.1",
            cflags = "-DTEST1"
        }
    },
    install = {
        lua = {
            ["example1.test"] = "lua/test.lua"
        }
    },
    copy_directories = {}
}
