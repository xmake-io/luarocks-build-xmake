#include "test.h"

int luaopen_test_hello1 (lua_State *L)
{
    lua_pushstring(L, "hello1");
    return 1;
}
