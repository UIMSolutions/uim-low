/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.mixins.engine;

import uim.logging;

@safe:

string logEngineThis(string name = null) {
    string fullName = name ~ "LogEngine";
    return objThis(fullName);
}

template LogEngineThis(string name = null) {
    const char[] LogEngineThis = logEngineThis(name);
}

string logEngineCalls(string name) {
    string fullName = name ~ "LogEngine";
    return objCalls(fullName);
}

template LogEngineCalls(string name) {
    const char[] LogEngineCalls = logEngineCalls(name);
}
