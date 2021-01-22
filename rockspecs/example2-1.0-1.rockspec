package = "example2"
version = "1.0-1"
source = {
    url = "git://github.com/xmake-io/luarocks-build-xmake",
    tag = "example2"
}
dependencies = {
    "lua >= 5.1",
    "luarocks-build-xmake"
}
build = {
    type = "xmake",
    variables = {
        xmake = {
            version = "2.5.1"
        }
    },
    modules = {
        ["example2.hello"] = {
            sources = "src/test.c"
        }
    },
    install = {
        lua = {
            ["example2.test"] = "lua/test.lua"
        }
    },
    copy_directories = {}
}

