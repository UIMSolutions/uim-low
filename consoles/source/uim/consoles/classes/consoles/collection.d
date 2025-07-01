/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.classes.consoles.collection;

import uim.consoles;
@safe:

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:


class DConsoleCollection : DCollection!DConsole {
}
auto ConsoleCollection() {
    return new DConsoleCollection;
}

unittest {
    auto collection = ConsoleCollection();
    assert(collection !is null);
}
