/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.loggers.multi;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DMultiLogger : DLogger {
  mixin(LoggerThis!("Multi"));

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

mixin(LoggerCalls!("Multi"));

unittest {
  auto logger = MultiLogger;
  assert(testLogger(logger));
}