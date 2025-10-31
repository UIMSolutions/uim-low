/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.helpers.factory;

import uim.logging;

mixin(Version!"test_uim_logging");
@safe:

class DLogFormatterFactory : DFactory!ILogFormatter {
    mixin(FactoryThis!("LogFormatter"));
}
mixin(FactoryCalls!("LogFormatter"));

unittest {
  auto factory = new DLogFormatterFactory;
  assert(testFactory(factory, "LogFormatter"), "Test LogFormatterFactory failed");
}


