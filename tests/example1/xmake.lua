add_rules("mode.debug", "mode.release")

add_requires("lua")
target("test")
    set_kind("shared")
    add_files("src/test.c")
    add_packages("lua")

