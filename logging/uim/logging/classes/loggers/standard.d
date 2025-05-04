/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.loggers.standard;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DStandardLogger : DLogger {
  mixin(LoggerThis!("Standard"));

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    return true;
  }

  override ILogger log(string logLevel, string logMessage, Json[string] logContext = null) {
    // TODO
    return this;
  }
}

mixin(LoggerCalls!("Standard"));

unittest {
  auto logger = StandardLogger;
  assert(testLogger(logger));
}