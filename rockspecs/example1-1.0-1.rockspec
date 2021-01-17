package = "example1"
version = "1.0-1"
source = {
    url = "https://github.com/xmake-io/luarocks-build-xmake/archive/example1.tar.gz",
}
dependencies = {
    "lua >= 5.1",
    "luarocks-build-xmake"
}
build = {
    type = "xmake",
    modules = {
        ["example1.hello"] = {
            sources = "src/test.c"
        }
    },
    copy_directories = {}
}
