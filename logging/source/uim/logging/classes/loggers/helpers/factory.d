/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.loggers.helpers.factory;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DLoggerFactory : DFactory!ILogger {
  mixin(FactoryThis!("Logger"));
}
mixin(FactoryCalls!("Logger"));

unittest {
  auto factory = LogLoggerFactory;
  assert(testFactory(factory, "Logger"), "Test LoggerFactory failed");
}