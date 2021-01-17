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
    modules = {},
    copy_directories = {}
}
