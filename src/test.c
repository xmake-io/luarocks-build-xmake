#include "test.h"

int luaopen_example2_hello (lua_State *L)
{
    lua_pushstring(L, "hello2");
    return 1;
}
