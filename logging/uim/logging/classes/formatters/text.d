/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.text;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:
class DTextLogFormatter : DLogFormatter {
    mixin(LogFormatterThis!("Text"));

    override bool initialize(Json[string] initData = null) {
        if (!super.initialize(initData)) {
            return false;
        }

        return true;
    }

    override string format(string logLevel, string logMessage, Json[string] logData = null) {
        string result = logMessage;
        result = configuration.getBooleanEntry("includeDate")
            ? "%s %s: %s".format(
                uim.core.datatypes.datetime.toString(nowDateTime, configuration.getStringEntry(
                    "dateFormat")), logLevel, logMessage) : "%s: %s".format(logLevel, logMessage);

        return configuration.getBooleanEntry("includeTags")
            ? "<%s>%s</%s>".format(logLevel, result, logLevel) : result;
    }
}

mixin(LogFormatterCalls!("Text"));

unittest {
  auto formatter = TextLogFormatter;
  assert(testLogFormatter(formatter));
  
  assert(LogFormatterFactory.create("text").name == "TextLogFormatter");
}