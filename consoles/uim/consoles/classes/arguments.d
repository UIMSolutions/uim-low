/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.classes.arguments;

import uim.consoles;
@safe:

version (test_uim_consoles) {
    unittest {
        writeln("-----  ", __MODULE__, "\t  -----");
    }
}

// Provides an interface for interacting with a command`s options and arguments.
class DArguments {
  this(string[size_t] newArguments, Json[string] newOptions, string[size_t] newNames) {
    _arguments = newArguments;
    _options = newOptions;
    _names = newNames;
  }

  // #region arguments
  // Positional argument name map
  protected string[size_t] _names;

  size_t indexOfName(string name) {
    size_t index = -1;
    foreach (k, v; _names) {
      if (v == name) {
        index = k;
        break;
      }
    }
    return index;
  }

  bool hasIndex(size_t index) {
    return (index in _names) ? true : false;
  }

  // Get positional arguments by index.
  string argumentAt(size_t index) {
    /* return hasArgumentAt(index) 
        ? _arguments[index]
        : Json(null); */
    return null;
  }

  // Positional arguments.
  protected string[size_t] _arguments;
  // Get all positional arguments.
  string[size_t] arguments() {
    return _arguments;
  }

  // Check if a positional argument exists
  bool hasArgumentAt(size_t index) {
    return hasIndex(index) ? true : false;
  }

  // Check if a positional argument exists by name
  bool hasArgument(string name) {
    size_t index = indexOfName(name);
    return index < 0
      ? false : hasIndex(index);
  }

  // Check if a positional argument exists by name
  string argument(string name) {
    size_t index = indexOfName(name);
    return index < 0 || !hasIndex(index)
      ? null : _arguments[index];
  }
  // #endregion arguments

  // #region options
  // Get an array of all the options
  protected Json[string] _options;

  Json[string] options() {
    if (_options is null) {
      _options = new Json[string];
    }
    return _options.dup;
  }

  // Get an option`s value or null
  Json option(string name) {
    return _options.getJson(name);
  }

  // Check if an option is defined and not null.
  bool hasOption(string name) {
    return _options.hasKey(name);
  }
  // #endregion options
}
