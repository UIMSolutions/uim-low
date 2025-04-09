/****************************************************************************************************************
* Copyright: © 2017-2024 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.collections.logger;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DLoggerCollection : DCollection!DLogger {   
}
auto LoggerCollection() { return new DLoggerCollection; }

unittest {
  auto collection = LoggerCollection;
  assert(collection !is null);
}