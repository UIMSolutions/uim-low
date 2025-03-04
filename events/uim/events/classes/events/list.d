/****************************************************************************************************************
* Copyright: © 2017-2024 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.events.classes.events.list;

import uim.events;

@safe:
/**
 * The Event List
 *
 * @template-implements \ArrayAccess<int, \UIM\Event\IEvent>
 */
class DEventList { // }: ArrayAccess, Countable {
    // Events list
    protected IEvent[] _events = null;

    // Empties the list of dispatched events.
    void flush() {
        _events = null;
    }

    // Adds an event to the list when event listing is enabled.
    void add(IEvent event) {
        _events ~= event;
    }

    // Whether a offset exists
    bool offsethasKey(Json anOffset) {
        // TODO return _events.hasValue(anOffset);
        return false;
    }

    // Offset to retrieve
    IEvent offsetGet(Json offsetToRetrieve) {
        /* return offsethasKey(offsetToRetrieve)
            ? _events[offsetToRetrieve] : null; */
        return null;
    }

    // Offset to set
    void offsetSet(string offset, Json value) {
        // _events[offset] = value;
    }

    // Offset to unset
    void offsetUnset(string offset) {
        // TODO _events.removeKey(offset);
    }

    // Count elements of an object
    size_t count() {
        return _events.length;
    }

    // Checks if an event is in the list.
    bool hasEvent(string eventName) {
        return _events.any!(event => event.name == eventName);
    }
}
