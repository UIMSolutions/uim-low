/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.events.interfaces.manager;

import uim.events;
@safe:

version (test_uim_events) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

interface IEventManager {
    /**
     * Adds a new listener to an event.
     *
     * A variadic interface to add listeners that emulates jQuery.on().
     *
     * Binding an IEventListener:
     *
     * ```
     * eventManager.on(listener);
     * ```
     *
     * Binding with no options:
     *
     * ```
     * eventManager.on("Model.beforeSave", aCallable);
     * ```
     *
     * Binding with options:
     *
     * ```
     * eventManager.on("Model.beforeSave", ["priority": 90], aCallable);
     * ```
     * Params:
     * \UIM\Event\IEventListener|string aeventKey The event unique identifier name
     * with which the callback will be associated. If eventKey is an instance of
     * UIM\Event\IEventListener its events will be bound using the `implementedEvents()` methods.
     * Params:
     * callable|Json[string] options Either an array of options or the callable you wish to
     * bind to eventKey. If an array of options, the `priority` key can be used to define the order.
     * Priorities are treated as queues. Lower values are called before higher ones, and multiple attachments
     * added to the same priority queue will be treated in the order of insertion.
     * Params:
     * callable|null callable The callable auto you want invoked.
     */
    IEventManager on(
        /* IEventListener */
        string eventKey,/* callable| */
        Json[string] options = null  // ,
        /* callable callable = null */
    
    );

    /**
     * Remove a listener from the active listeners.
     *
     * Remove a IEventListener entirely:
     *
     * ```
     * manager.off(listener);
     * ```
     *
     * Remove all listeners for a given event:
     *
     * ```
     * manager.off("My.event");
     * ```
     *
     * Remove a specific listener:
     *
     * ```
     * manager.off("My.event", aCallback);
     * ```
     *
     * Remove a callback from all events:
     *
     * ```
     * manager.off(aCallback);
     * ```
     */
    IEventManager off(
        /* IEventListener|callable */
        string eventKey,/* IEventListener|callable */ // TODO callable aCallable = null
        
    );

    // Dispatches a new event to all configured listeners
    IEvent dispatch(IEvent event);
    IEvent dispatch(string eventName);

    // Returns a list of all listeners for an eventKey in the order they should be called
    Json[string] listeners(string eventKey);
}
