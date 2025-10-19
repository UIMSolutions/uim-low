/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.events.classes.events.event;

import uim.events;
@safe:

class DEvent : UIMObject, IEvent {
    mixin(EventThis!());

    /**
     * ### Examples of usage:
     *
     * ```
     * event = new DEvent("Order.afterBuy", this, ["buyer": userData]);
     * event = new DEvent("User.afterRegister", userModel);
     * ```
     */
    this(string name, IObject subject, Json[string] initData = null) {
        this(name, initData);
        _subject = subject;
        _data = initData;
    }

    // #region subject
    // The object this event applies to (usually the same object that generates the event)
    protected IObject _subject = null;
    // Returns the subject of this event
    IObject subject() {
        if (_subject is null) {
            // TODO throw new DEventsException("No subject set for this event");
        }
        return _subject;
    }
    // #endregion subject

    // Custom data for the method that receives the event
    protected Json[string] _data;

    // Property used to retain the result value of the event listeners
    mixin(TProperty!("Json", "result"));

    // Flags an event as stopped or not, default is false
    protected bool _isStopped = false;

    // Stops the event from being used anymore
    IEvent stopPropagation() {
        _isStopped = true;
        return this;
    }

    // Check if the event is stopped
    bool isStopped() {
        return _isStopped;
    }


    // #region data 
    Json opIndex(string key) {
        return data(key);
    }

    Json[string] data() {
        return _data;
    }

    Json data(string key) {
        // return _data.value(key);
        return Json(null);
    }



    // Assigns a value to the data of this event.
    IEvent data(string[] keys, bool value) {
        keys.each!(key => data(key, value));
        return this; 
    }

    IEvent data(string key, bool value) {
        data(key, Json(value));
        return this; 
    }

    IEvent data(string[] keys, long value) {
        keys.each!(key => data(key, value));
        return this; 
    }

    IEvent data(string key, long value) {
        data(key, Json(value));
        return this; 
    }

    IEvent data(string[] keys, double value) {
        keys.each!(key => data(key, value));
        return this; 
    }

    IEvent data(string key, double value) {
        data(key, Json(value));
        return this; 
    }

    IEvent data(string[] keys, string value) {
        keys.each!(key => data(key, value));
        return this; 
    }

    IEvent data(string key, string value) {
        data(key, Json(value));
        return this; 
    }

    IEvent data(string[] keys, Json value) {
        keys.each!(key => data(key, value));
        return this; 
    }
    
    IEvent data(string key, Json value) {
        _data[key] = value;
        return this; 
    }
    // #endregion data 
}
