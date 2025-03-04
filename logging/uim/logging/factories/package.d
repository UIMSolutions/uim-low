/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.factories;

public {
  import uim.logging.factories.formatter;
  import uim.logging.factories.logger;
}

static this() { // Init factories
  import uim.logging;

  // #region init LogFormatter factory
  // CsvLogFormatter
  LogFormatterFactory.set(CsvLogFormatter.classname, (Json[string] options = null) @safe {
    return CsvLogFormatter(options);
  });
  LogFormatterFactory.set("csv", (Json[string] options = null) @safe {
    return CsvLogFormatter(options);
  });

  // HtmlLogFormatter
  LogFormatterFactory.set(HtmlLogFormatter.classname, (Json[string] options = null) @safe {
    return HtmlLogFormatter(options);
  });
  LogFormatterFactory.set("html", (Json[string] options = null) @safe {
    return HtmlLogFormatter(options);
  });

  // JsonLogFormatter
  LogFormatterFactory.set(JsonLogFormatter.classname, (Json[string] options = null) @safe {
    return JsonLogFormatter(options);
  });
  LogFormatterFactory.set("json", (Json[string] options = null) @safe {
    return JsonLogFormatter(options);
  });

  // StandardLogFormatter
  LogFormatterFactory.set(StandardLogFormatter.classname, (Json[string] options = null) @safe {
    return StandardLogFormatter(options);
  });
  LogFormatterFactory.set("standard", (Json[string] options = null) @safe {
    return StandardLogFormatter(options);
  });

  // TextLogFormatter
  LogFormatterFactory.set(TextLogFormatter.classname, (Json[string] options = null) @safe {
    return TextLogFormatter(options);
  });
  LogFormatterFactory.set("text", (Json[string] options = null) @safe {
    return TextLogFormatter(options);
  });

  // XmlLogFormatter
  LogFormatterFactory.set("xml", (Json[string] options = null) @safe {
    return XmlLogFormatter(options);
  });
  LogFormatterFactory.set("xml", (Json[string] options = null) @safe {
    return XmlLogFormatter(options);
  });
  // #endregion init LogFormatter factory

  // #region init Logger factory
  LoggerFactory.set("console", (Json[string] options = null) @safe {
    return ConsoleLogger(options);
  });
  LoggerFactory.set(ConsoleLogger.classname, (Json[string] options = null) @safe {
    return ConsoleLogger(options);
  });

  LoggerFactory.set("file", (Json[string] options = null) @safe {
    return new DFileLogger(options);
  });

  LoggerFactory.set("memory", (Json[string] options = null) @safe {
    return MemoryLogger(options);
  });

  LoggerFactory.set("multi", (Json[string] options = null) @safe {
    return MultiLogger(options);
  });

  LoggerFactory.set("null", (Json[string] options = null) @safe {
    return NullLogger(options);
  });

  LoggerFactory.set("standard", (Json[string] options = null) @safe {
    return StandardLogger(options);
  });

  LoggerFactory.set("syslog", (Json[string] options = null) @safe {
    return StandardLogger(options);
  });
  // #endregion init Logger factory
}