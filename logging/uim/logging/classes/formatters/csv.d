/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.csv;

import uim.logging;

@safe:

version (test_uim_logging) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

class DCsvLogFormatter : DLogFormatter {
  mixin(LogFormatterThis!("Csv"));

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

mixin(LogFormatterCalls!("Csv"));

unittest {
  auto formatter = CsvLogFormatter;
  assert(testLogFormatter(formatter));
  
  assert(LogFormatterFactory.create("csv").name == "CsvLogFormatter");
}