/*
 * Copyright 2015 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef LUA_MONGOC_DATABASE_H
#define LUA_MONGOC_DATABASE_H

#include "lua-mongoc-wrapper.h"
#include "lua-bson.h"

int lua_mongo_database_new (lua_State *L);
int lua_mongo_database_get_collection_names (lua_State *L);
int lua_mongo_database_has_collection (lua_State *L);
int lua_mongo_database_destroy (lua_State *L);
int lua_mongo_database_command_simple (lua_State *L);
int lua_mongo_database_drop (lua_State *L);

static const struct luaL_Reg lua_mongoc_database_methods[] = {
    { "get_collection_names", lua_mongo_database_get_collection_names },
    { "database_drop", lua_mongo_database_drop },
    { "has_collection", lua_mongo_database_has_collection },
    { "command_simple", lua_mongo_database_command_simple },
    { "__gc", lua_mongo_database_destroy },
    { NULL,NULL },
};

static const struct luaL_Reg lua_mongoc_database_functions[] = {
    { "new", lua_mongo_database_new },
    { NULL, NULL }
};

typedef struct {
    mongoc_client_t *c_client;
    mongoc_database_t *c_database;
} database_t;

#endif //LUA_MONGOC_DATABASE_H
