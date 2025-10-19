/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.subclasses.html;

mixin(Version!"test_uim_logging");

import uim.logging;

@safe:

class DHtmlLogFormatter : DLogFormatter {
  mixin(LogFormatterThis!("Html"));

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    return true;
  }

  override string format(string logLevel, string logMessage, Json[string] logData = null) {
    string result = logMessage;
    // TODO
    return result;
  }
}

mixin(LogFormatterCalls!("Html"));

unittest {
  // Test: Formatter can be instantiated
  auto formatter = new DHtmlLogFormatter();
  assert(formatter !is null);

  // Test: initialize returns true by default
  assert(formatter.initialize());

  // Test: initialize returns true with custom data
  Json[string] data;
  data["foo"] = Json("bar");
  assert(formatter.initialize(data));

  // Test: format returns the logMessage as-is
  string logLevel = "INFO";
  string logMessage = "Test message";
  assert(formatter.format(logLevel, logMessage) == logMessage);

  // Test: format returns the logMessage as-is with logData
  Json[string] logData;
  logData["key"] = Json("value");
  assert(formatter.format(logLevel, logMessage, logData) == logMessage);

  // Test: format handles empty logMessage
  assert(formatter.format(logLevel, "") == "");

  // Test: format handles null logData
  assert(formatter.format(logLevel, logMessage, null) == logMessage);
}
