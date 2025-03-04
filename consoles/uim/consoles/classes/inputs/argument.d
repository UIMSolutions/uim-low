/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.classes.inputs.argument;

import uim.consoles;
@safe:

version (test_uim_consoles) {
    unittest {
        writeln("-----  ", __MODULE__, "\t  -----");
    }
}

/**
 * An object to represent a single argument used in the command line.
 * DConsoleOptionParser buildOptionParser creates these when you use addArgument()
 */
class DInputArgument : UIMObject {
  mixin(ArgumentThis!("InputConsole"));

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    return true;
  }

  // Help string
  protected string _help;

  // Is this option required?
  protected bool _required;
  // Check if this argument is a required argument
  bool isRequired() {
    return _required;
  }

  // An array of valid choices for this argument.
  protected string[] _choices;

  // Make a new DInput Argument
  this(string optionName, string helpText = "", bool isArgumentRequired = false, string[] validChoices = null) {
    _name = optionName;
    _help = help;
    _required = isArgumentRequired;
    _choices = validChoices;
  }

  this(string[string] aName, string ahelp = "", bool isArgumentRequired = false, string[] optionChoices = null) {
    /* if (names.contains("name")) {
            foreach (aKey, aValue; names) {
                /* this. {
                    "_" ~ aKey
                }
                = aValue; * /
            }
        } */
  }

  // Checks if this argument is equal to another argument.
  bool isEqualTo(DInputArgument argument) {
    /* return _name() == argument.name() &&
            this.usage() == argument.usage(); */
    return false;
  }

  /**
     * Generate the help for this argument.
     * Params:
     * int width The width to make the name of the option.
     */
  string help(int width = 0) {
    auto helpName = _name;
    if (helpName.length < width) {
      /* helpName = str_pad(helpName, width, " "); */
    }
    auto optional = "";
    if (!isRequired()) {
      optional = " <comment>(optional)</comment>";
    }
    if (_choices) {
      optional ~= " <comment>(choices: %s)</comment>".format(_choices.join("|"));
    }
    return "%s%s%s".format(helpName, _help, optional);
  }

  // Get the usage value for this argument
  string usage() {
    string usageName = _name;
    if (_choices) {
      usageName = _choices.join("|");
    }
    usageName = "<" ~ usageName ~ ">";
    if (!isRequired()) {
      usageName = "[" ~ usageName ~ "]";
    }
    return usageName;
  }

  // Check that aValue is a valid choice for this argument.
  bool validChoice(string choiceToValidate) {
    if (_choices.isEmpty) {
      return true;
    }
    /* if (!_choices.has(choiceToValidate)) {
            throw new DConsoleException(
                "`%s` is not a valid value for `%s`. Please use one of `%s`"
                    .format(choiceToValidate, _name, _choices.join(", "))
           );
        } */
    return true;
  }

  // Append this arguments XML representation to the passed in SimpleXml object.
  // DSimpleXMLElement xml(SimpleXMLElement parentElement) {
  /* auto option = parentElement.addChild("argument");
        option.addAttribute("name", _name);
        option.addAttribute("help", _help);
        option.addAttribute("required", to!string(to!int(isRequired())));

        auto choices = option.addChild("choices");
        choices.each!(valid => choices.addChild("choice", valid));
        return parentElement; */
  /* return null; 
    } */
}
