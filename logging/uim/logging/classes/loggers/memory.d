/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.loggers.memory;

mixin(Version!"test_uim_logging");

import uim.logging;

@safe:

/**
 * Array logger.
 *
 * Collects log messages in memory. Intended primarily for usage
 * in testing where using mocks would be complicated. But can also
 * be used in scenarios where you need to capture logs in application code.
 */
class DMemoryLogger : DLogger {
  mixin(LoggerThis!("Memory"));

  override bool initialize(Json[string] initData = null) {
    writeln("DMemoryLogger::initialize(Json[string] initData = null) - ", this.classinfo);
    if (!super.initialize(initData)) {
      return false;
    }

    configuration
      .setEntry("formatter.classname", StandardLogFormatter.classname)
      .setEntry("formatter.includeDate", false);

    return true;
  }

  // Captured messages
  protected string[] _content;

  // Writing to the internal storage.
  override ILogger log(string logLevel, string logMessage, Json[string] logContext = null) {
    // auto interpolatedMessage = interpolate(logMessage, logContext);
    // TODO _content ~= _formatter.format(logLevel, interpolatedMessage, logContext);
    return this;
  }

  // Read the internal storage
  string[] read() {
    return _content;
  }

  // Reset internal storage.
  void clear() {
    _content = null;
  }
}

mixin(LoggerCalls!("Memory"));

unittest {
  auto logger = MemoryLogger;
  assert(logger !is null);
}
