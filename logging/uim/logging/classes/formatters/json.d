/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.json;

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

    override string format(LogLevels logLevel, string logMessage, Json[string] logData = null) {
    Json[string] log;
        log
      // .set("date", uim.core.datatypes.datetime.toString(nowDateTime, configuration.getStringEntry("dateFormat"))) 
      // .set("level", to!string(logLevel))
      .set("message", logMessage);

    return log.toString ~ configuration.hasEntry("appendNewline") ? "\n" : "";
  }
}
mixin(LogFormatterCalls!("Json"));

unittest {
  auto formatter = JsonLogFormatter;
  assert(testLogFormatter(formatter));
  
  assert(LogFormatterFactory.create("json").name == "JsonLogFormatter");
}