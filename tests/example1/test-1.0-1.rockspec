package = "test"
version = "1.0-1"
source = {
    url = "git://github.com/xmake-io/luarocks-build-xmake",
    tag = "1.0"
}
dependencies = {
    "lua >= 5.1",
    "luarocks-build-xmake"
}
build = {
    type = "xmake",
    modules = {
        test = {
            sources = {
                "test/src/main.c",
                "test/src/interface.c"
            }
        }
    },
	copy_directories = {}
}
