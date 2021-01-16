add_rules("mode.debug", "mode.release")

target("test")
    set_kind("shared")
    add_files("src/test.c")

