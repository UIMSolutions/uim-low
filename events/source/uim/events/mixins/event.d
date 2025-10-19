/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.events.mixins.event;


mixin(Version!"test_uim_events");

import uim.events;
@safe:


string eventThis(string name = null) {
    string fullName = name ~ "Event";
    return objThis(fullName);
}

template EventThis(string name = null) {
    const char[] EventThis = eventThis(name);
}

string eventCalls(string name) {
    string fullName = name ~ "Event";
    return objCalls(fullName);
}

template EventCalls(string name) {
    const char[] EventCalls = eventCalls(name);
}
