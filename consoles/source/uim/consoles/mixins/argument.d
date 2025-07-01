/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.mixins.argument;

import uim.consoles;

@safe:
string argumentThis(string name = null) {
    string fullName = name ~ "Argument";
    return objThis(fullName);
}

template ArgumentThis(string name = null) {
    const char[] ArgumentThis = argumentThis(name);
}

string argumentCalls(string name) {
    string fullName = name ~ "Argument";
    return objCalls(fullName);
}

template ArgumentCalls(string name) {
    const char[] ArgumentCalls = argumentCalls(name);
}
