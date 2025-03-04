/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.events.exceptions.exception;

import uim.events;
@safe:

version (test_uim_events) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

// Base events exception.
class DEventsException : DException {
  mixin(ExceptionThis!("Events"));

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    messageTemplate("default", "Exception in libary uim-events");

    return true;
  }
}

mixin(ExceptionCalls!("Events"));

unittest {
  testException(EventsException);
}
