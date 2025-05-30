/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.xml;

import uim.logging;

@safe:

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

class DXmlLogFormatter : DLogFormatter {
    mixin(LogFormatterThis!("Xml"));

    override string format(string logLevel, string logMessage, Json[string] logData = null) {
        string result = logMessage;
        // TODO
        return result;
    }
}

mixin(LogFormatterCalls!("Xml"));

unittest {
  auto formatter = XmlLogFormatter;
  assert(testLogFormatter(formatter));
  
  assert(LogFormatterFactory.create("xml").name == "XmlLogFormatter");
}