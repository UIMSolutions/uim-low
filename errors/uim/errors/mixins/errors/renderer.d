/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.mixins.errors.renderer;

import uim.errors;

@safe:
string errorRendererThis(string name = null) {
    string fullName = name ~ "ErrorRenderer";
    return objThis(fullName);
}

template ErrorRendererThis(string name = null) {
    const char[] ErrorRendererThis = errorRendererThis(name);
}

string errorRendererCalls(string name) {
    string fullName = name ~ "ErrorRenderer";
    return objCalls(fullName);
}

template ErrorRendererCalls(string name) {
    const char[] ErrorRendererCalls = errorRendererCalls(name);
}
