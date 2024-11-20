package = "example2"
version = "1.0-1"
source = {
    url = "git+https://github.com/xmake-io/luarocks-build-xmake",
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
            version = "2.7.6",
            cflags = "-DTEST2"
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

