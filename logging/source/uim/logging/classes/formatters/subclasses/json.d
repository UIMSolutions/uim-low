/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.subclasses.jsonx;

import uim.logging;

@safe:

mixin(Version!"test_uim_logging");

import uim.logging;

@safe:

class DJsonLogFormatter : DLogFormatter {
  mixin(LogFormatterThis!("Json"));

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    configuration
      .setEntry("dateFormat", "DATE_ATOM")
      .setEntry("appendNewline", true);

    return true;
  }

  override string format(string logLevel, string logMessage, Json[string] logData = null) {
    Json[string] log;
    log // .set("date", uim.core.datatypes.datetime.toString(nowDateTime, configuration.getStringEntry("dateFormat"))) 
    // .set("level", to!string(logLevel))
    .set("message", logMessage);

    return log.toString ~ configuration.hasEntry("appendNewline") ? "\n" : "";
  }
}

mixin(LogFormatterCalls!("Json"));

unittest {
  // Test: Formatter initializes with correct configuration
  auto formatter = new DJsonLogFormatter();
  assert(formatter.initialize());
  assert(formatter.configuration.getStringEntry("dateFormat") == "DATE_ATOM");
  assert(formatter.configuration.getBoolEntry("appendNewline") == true);

  // Test: format() returns JSON string with message and newline
  string logLevel = "INFO";
  string logMessage = "Hello, world!";
  string result = formatter.format(logLevel, logMessage);
  assert(result[$ - 1] == '\n', "Should append newline");
  assert(result.canFind(`"message":"Hello, world!"`));

  // Test: format() without newline if appendNewline is false
  formatter.configuration.setEntry("appendNewline", false);
  result = formatter.format(logLevel, logMessage);
  assert(result[$ - 1] != '\n', "Should not append newline");

  // Test: format() with logData (should ignore and just set message)
  import std.json : parseJSON;

  result = formatter.format("ERROR", "Test error", null);
  auto json = parseJSON(result.strip);
  assert(json["message"].str == "Test error");

  // Test: initialize returns false if super.initialize fails
  class BadFormatter : DJsonLogFormatter {
    override bool initialize(Json[string] initData = null) {
      return false;
    }
  }

  auto bad = new BadFormatter();
  assert(!bad.initialize());
}
