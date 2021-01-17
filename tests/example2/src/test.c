#include "test.h"

int luaopen_test_hello (lua_State *L)
{
    lua_pushstring(L, "hello");
    return 1;
}

