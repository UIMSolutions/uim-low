/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.standard;

import uim.logging;

@safe:

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

// Base class for LogFormatters
class DStandardLogFormatter : DLogFormatter {
  mixin(LogFormatterThis!("Standard"));

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    return true;
  }

  override string format(LogLevels logLevel, string logMessage, Json[string] logData = null) {
    string result = logMessage;
    // TODO
    return result;
  }
}

mixin(LogFormatterCalls!("Standard"));

unittest {
/*   auto formatter = StandardLogFormatter;
  assert(testLogFormatter(formatter));
  
  assert(LogFormatterFactory.create("standard").name == "StandardLogFormatter");
 */}