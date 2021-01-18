add_rules("mode.debug", "mode.release")

target("example1.hello")
    add_rules("luarocks.module")
    add_files("src/test.c")
