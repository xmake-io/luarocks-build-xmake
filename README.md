<div align="center">
  <a href="https://xmake.io">
    <img width="160" heigth="160" src="https://tboox.org/static/img/xmake/logo256c.png">
  </a>

  <h1>luarocks-build-xmake</h1>

  <div>
    <a href="https://github.com/xmake-io/luarocks-build-xmake/actions?query=workflow%3AWindows">
      <img src="https://img.shields.io/github/workflow/status/xmake-io/luarocks-build-xmake/Windows/dev.svg?style=flat-square&logo=windows" alt="github-ci" />
    </a>
    <a href="https://github.com/xmake-io/luarocks-build-xmake/actions?query=workflow%3ALinux">
      <img src="https://img.shields.io/github/workflow/status/xmake-io/luarocks-build-xmake/Linux/dev.svg?style=flat-square&logo=linux" alt="github-ci" />
    </a>
    <a href="https://github.com/xmake-io/luarocks-build-xmake/actions?query=workflow%3AmacOS">
      <img src="https://img.shields.io/github/workflow/status/xmake-io/luarocks-build-xmake/macOS/dev.svg?style=flat-square&logo=apple" alt="github-ci" />
    </a>
  </div>
  <div>
    <a href="https://www.reddit.com/r/xmake-io/">
      <img src="https://img.shields.io/badge/chat-on%20reddit-ff3f34.svg?style=flat-square" alt="Reddit" />
    </a>
    <a href="https://gitter.im/tboox/tboox?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge">
      <img src="https://img.shields.io/gitter/room/tboox/tboox.svg?style=flat-square&colorB=96c312" alt="Gitter" />
    </a>
    <a href="https://t.me/tbooxorg">
      <img src="https://img.shields.io/badge/chat-on%20telegram-blue.svg?style=flat-square" alt="Telegram" />
    </a>
    <a href="https://jq.qq.com/?_wv=1027&k=5hpwWFv">
      <img src="https://img.shields.io/badge/chat-on%20QQ-ff69b4.svg?style=flat-square" alt="QQ" />
    </a>
    <a href="https://discord.gg/XXRp26A4Gr">
      <img src="https://img.shields.io/badge/chat-on%20discord-7289da.svg?style=flat-square" alt="Discord" />
    </a>
    <a href="https://github.com/xmake-io/luarocks-build-xmake/blob/master/LICENSE.md">
      <img src="https://img.shields.io/github/license/xmake-io/luarocks-build-xmake.svg?colorB=f48041&style=flat-square" alt="license" />
    </a>
    <a href="http://xmake.io/pages/donation.html#donate">
      <img src="https://img.shields.io/badge/donate-us-orange.svg?style=flat-square" alt="Donate" />
    </a>
  </div>

  <p>A luarocks build module based on xmake</p>
</div>

## Introduction ([中文](/README_zh.md))

A fork of built-in build system for C++ rocks. Specify "xmake" as build type and "luarocks-build-xmake" as dependency to use it.

## Example1 (with xmake.lua)

We can build c/c++ modules if the project contain xmake.lua

```lua
add_rules("mode.debug", "mode.release")

add_requires("lua")
target("example1.hello")
    if is_plat("macosx") then
        set_kind("binary")
        set_filename("hello.so")
        add_ldflags("-bundle", "-undefined dynamic_lookup", {force = true})
    else
        set_kind("shared")
        set_basename("hello")
    end
    set_symbols("none")
    add_files("src/test.c")
    add_packages("lua")
    on_install(function (target)
        local moduledir = path.directory((target:name():gsub('%.', '/')))
        import('target.action.install')(target, {libdir = path.join('lib', moduledir), bindir = path.join('lib', moduledir)})
    end)
```

```lua
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
    copy_directories = {}
}
```

## Example2 (without xmake.lua)

```lua
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
    modules = {
        ["example2.hello"] = {
            sources = "src/test.c"
        }
    },
    copy_directories = {}
}
```
