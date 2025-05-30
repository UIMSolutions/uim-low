/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.yaml;

import uim.logging;

@safe:

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DYamlLogFormatter : DLogFormatter {
    mixin(LogFormatterThis!("Yaml"));

    override string format(string logLevel, string logMessage, Json[string] logData = null) {
        string result = logMessage;
        // TODO
        return result;
    }
}

mixin(LogFormatterCalls!("Yaml"));

unittest {
/*   auto formatter = YamlLogFormatter;
  assert(testLogFormatter(formatter));
  
  assert(LogFormatterFactory.create("yaml").name == "YamlLogFormatter"); */
}