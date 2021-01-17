<div align="center">
  <a href="https://xmake.io">
    <img width="160" heigth="160" src="https://tboox.org/static/img/xmake/logo256c.png">
  </a>

  <h1>luarocks-build-xmake</h1>

  <div>
    <a href="https://github.com/xmake-io/luarocks-build-xmake/actions?query=workflow%3AWindows">
      <img src="https://img.shields.io/github/workflow/status/xmake-io/luarocks-build-xmake/Windows/master.svg?style=flat-square&logo=windows" alt="github-ci" />
    </a>
    <a href="https://github.com/xmake-io/luarocks-build-xmake/actions?query=workflow%3ALinux">
      <img src="https://img.shields.io/github/workflow/status/xmake-io/luarocks-build-xmake/Linux/master.svg?style=flat-square&logo=linux" alt="github-ci" />
    </a>
    <a href="https://github.com/xmake-io/luarocks-build-xmake/actions?query=workflow%3AmacOS">
      <img src="https://img.shields.io/github/workflow/status/xmake-io/luarocks-build-xmake/macOS/master.svg?style=flat-square&logo=apple" alt="github-ci" />
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

## 简介

替换 luarocks 内置的构建系统去构建 C/C++ 模块，指定 xmake 作为构建类型，并添加 `luarocks-build-xmake` 依赖项。

## 例子1 (带有 xmake.lua)

如果模块工程中使用了 xmake.lua 来维护构建，那么我们可以直接使用 xmake 去构建它，rockspec 文件中不需要额外的配置构建规则。

```
├── src
│   ├── test.c
│   └── test.h
└── xmake.lua
```

#### xmake.lua

我们需要使用 `add_rules("luarocks.module")` 添加针对 luarocks 模块构建规则。

```lua
add_rules("mode.debug", "mode.release")

target("example1.hello")
    add_rules("luarocks.module")
    add_files("src/test.c")
```

#### rockspec

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

## 例子2 (没有 xmake.lua)

如果模块工程中没有使用 xmake.lua 来维护，那么我们也可以使用 xmake 替代 luarocks 内置的构建来编译，只需要在 rockspec 文件中去描述构建规则。

```
├── src
    ├── test.c
    └── test.h
```

#### rockspec

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
