package = "test"
version = "1.0-1"
source = {
    url = "https://github.com/xmake-io/luarocks-build-xmake/releases/download/1.0/example1.zip",
}
dependencies = {
    "lua >= 5.1",
    "luarocks-build-xmake"
}
build = {
    type = "xmake",
    modules = {
        ["test.hello1"] = {
            sources = "src/test.c"
        }
    },
    copy_directories = {}
}
