/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.loggers.helpers.collection;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DLoggerCollection : DCollection!DLogger {   
}
mixin(CollectionCalls!("Logger"));

unittest {
  auto collection = LoggerCollection;
  assert(collection !is null);

  assert(testCollection(collection, "Logger"), "Test LoggerCollection failed");
}