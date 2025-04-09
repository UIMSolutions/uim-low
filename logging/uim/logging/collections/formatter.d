/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.collections.formatter;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DLogFormatterCollection : DCollection!DLogFormatter {   
}
auto LogFormatterCollection() { return new DLogFormatterCollection; }

unittest {
  auto collection = LogFormatterCollection;
  assert(collection !is null);
}