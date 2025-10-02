/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.subclasses.csv;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DCsvLogFormatter : DLogFormatter {
  mixin(LogFormatterThis!("Csv"));

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
mixin(LogFormatterCalls!("Csv"));

unittest {
    // Test: Formatter can be instantiated
    auto formatter = new DCsvLogFormatter();
    assert(formatter !is null);

    // Test: initialize returns true by default
    assert(formatter.initialize());

    // Test: format returns the logMessage as is (since TODO not implemented)
    string logLevel = "INFO";
    string logMessage = "Test message";
    assert(formatter.format(logLevel, logMessage) == logMessage);

    // Test: format with logData (should still return logMessage)
    import std.json : JSONValue;
    JSONValue[string] logData;
    logData["user"] = JSONValue("ozan");
    assert(formatter.format(logLevel, logMessage, logData) == logMessage);

    // Test: Factory creates correct formatter
    auto created = LogFormatterFactory.create("csv");
    assert(created !is null);
    assert(created.name == "CsvLogFormatter");
    assert(cast(DCsvLogFormatter)created !is null);
}