/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur) 
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file. 
* Authors: Ozan Nurettin Süel (aka UIManufaktur)
*****************************************************************************************************************/
module uim.logging.classes.loggers.tests.test;

import uim.logging;
mixin(Version!"test_uim_logging");

@safe:

bool testLogger(ILogger logger, string loggerType) {
  assert(logger !is null, "Logger is null");
  assert(logger.type == loggerType, "Logger type mismatch");
  return true;
}