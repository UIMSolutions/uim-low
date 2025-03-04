/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.text;

import uim.logging;

@safe:

version (test_uim_logging) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}
class DTextLogFormatter : DLogFormatter {
    mixin(LogFormatterThis!("Text"));

    override bool initialize(Json[string] initData = null) {
        if (!super.initialize(initData)) {
            return false;
        }

        return true;
    }

    override string format(LogLevels logLevel, string logMessage, Json[string] logData = null) {
        string result = logMessage;
        result = configuration.getBoolean("includeDate")
            ? "%s %s: %s".format(
                uim.core.datatypes.datetime.toString(nowDateTime, configuration.getString(
                    "dateFormat")), logLevel, logMessage) : "%s: %s".format(logLevel, logMessage);

        return configuration.getBoolean("includeTags")
            ? "<%s>%s</%s>".format(logLevel, result, logLevel) : result;
    }
}

mixin(LogFormatterCalls!("Text"));

unittest {
  auto formatter = TextLogFormatter;
  assert(testLogFormatter(formatter));
  
  assert(LogFormatterFactory.create("text").name == "TextLogFormatter");
}