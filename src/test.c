#include "test.h"

int luaopen_example1_hello (lua_State *L)
{
    lua_pushstring(L, "hello1");
    return 1;
}
