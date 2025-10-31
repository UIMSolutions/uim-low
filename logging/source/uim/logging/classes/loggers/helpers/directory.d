/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.loggers.helpers.directory;

import uim.logging;

mixin(Version!"test_uim_logging");

@safe:

class DLoggerDirectory : DDirectory!ILogger {   
}
mixin(DirectoryCalls!("Logger"));

unittest {
  auto directory = LoggerDirectory;
  assert(testDirectory(directory, "Logger"), "Test LoggerDirectory failed");
}