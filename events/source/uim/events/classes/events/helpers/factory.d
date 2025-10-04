/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.events.classes.events.helpers.factory;

import uim.events;

mixin(Version!"test_uim_events");
@safe:

class DEventsFactory : DFactory!IEvent {
    mixin(FactoryThis!("Event"));
}
mixin(FactoryCalls!("Event"));

unittest {
  auto factory = new DEventsFactory();
  assert(factory !is null, "EventsFactory is null");

  assert(testFactory(factory, "Event"), "Test EventsFactory failed");
}
