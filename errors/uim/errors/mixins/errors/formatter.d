/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.mixins.errors.formatter;

import uim.errors;

@safe:
string errorFormatterThis(string name = null) {
    string fullName = name ~ "ErrorFormatter";
    return objThis(fullName);
}

template ErrorFormatterThis(string name = null) {
    const char[] ErrorFormatterThis = errorFormatterThis(name);
}

string errorCalls(string name) {
    string fullName = name ~ "ErrorFormatter";
    return objCalls(fullName);
}

template ErrorCalls(string name) {
    const char[] ErrorCalls = errorCalls(name);
}
