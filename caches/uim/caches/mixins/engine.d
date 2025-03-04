/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.caches.mixins.engine;

import uim.caches;

@safe:
string cacheEngineThis(string name = null) {
    string fullName = name ~ "CacheEngine";
    return objThis(fullName);
}

template CacheEngineThis(string name = null) {
    const char[] CacheEngineThis = cacheEngineThis(name);
}

string cacheEngineCalls(string name) {
    string fullName = name ~ "CacheEngine";
    return objCalls(fullName);
}

template CacheEngineCalls(string name) {
    const char[] CacheEngineCalls = cacheEngineCalls(name);
}