/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.loggers.logger;

mixin(Version!"test_uim_logging");

import uim.logging;

@safe:

class DLogger : UIMObject, ILogger {
  mixin(LoggerThis!());

  override bool initialize(Json[string] options = new Json[string]) {
    if (!super.initialize(options)) {
      return false;
    }

    configuration
      .setEntry("levels", Json.emptyArray)
      .setEntry("scopes", Json.emptyArray)
      .setEntry("formatter.classname", StandardLogFormatter.classname);

    if (options.hasKey("scopes")) {
      configuration.setEntry("scopes", options.getArray("scopes"));
    }
    configuration.setEntry("levels", options.getArray("levels"));

    if (options.hasKey("types") && configuration.isEmptyEntry("levels")) {
      configuration.setEntry("levels", options.getArray("types"));
    }

    _formatter = LogFormatterFactory.create(configuration.getStringEntry("formatter.classname"));

    return true;
  }

  // #region formatter
  protected ILogFormatter _formatter;
  ILogFormatter formatter() {
    return _formatter;
  };
  ILogger formatter(ILogFormatter newFormatter) {
    _formatter = newFormatter;
    return this;
  };
  // #endregion formatter

  // Get the levels this logger is interested in.
  string[] levels() {
    return configuration.getArrayEntry("levels").map!(x => x.toString).array;
  }

  // Get the scopes this logger is interested in.
  string[] scopes() {
    return configuration.getArrayEntry("scopes").map!(x => x.toString).array;
  }

  // Replaces placeholders in message string with logContext values.
  protected string interpolate(string message, Json[string] contextValues = null) {
    if (!message.containsAll("{", "}")) { // No placeholders
      return message;
    }

    STRINGAA replacements;
    contextValues.each!((key, value) => replacements[key] = interpolate(value));
    return message.mustache(replacements);
  }

  string interpolate(Json contextValue) {
    return contextValue.toString;
    if (contextValue.isScalar) {
      return contextValue.toString;
    }

    if (contextValue.isArray) {
      return contextValue.toString;
    }

    if (contextValue.isObject) {
      return contextValue.toString;
    }

    return contextValue.toString;
  }

  abstract ILogger log(string level, string message, Json[string] contextValues = null);
}
