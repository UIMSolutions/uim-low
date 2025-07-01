/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.mixins.log;

import uim.logging;

@safe:

// Template providing an object short-cut method to logging.
mixin template TLog() {
  /**
     * Convenience method to write a message to Log. See Log.write()
     * for more information on writing to logs.
     */
  bool log(string logMessage,
    LogLevels errorLevel = LogLevels.error,
    Json[string] logData = null
  ) {
    // return Log.write(errorLevel, logMessage, logData);
    return false;
  }
}
