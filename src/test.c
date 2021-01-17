#include "test.h"

int luaopen_test_hello2 (lua_State *L)
{
    lua_pushstring(L, "hello2");
    return 1;
}
