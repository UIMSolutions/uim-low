/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.classes.inputs.option;

import uim.consoles;
@safe:

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:


/**
 * An object to represent a single option used in the command line.
 * DConsoleOptionParser buildOptionParser creates these when you use addOption()
 */
class DInputOptionConsole : DConsole {
    mixin(ConsoleThis!("InputOption"));

    // Short (1 character) alias for the option.
    protected string _shortAlias;
    
    //  Get the value of the short attribute.
    string shortAlias() {
        return _shortAlias;
    }

    // Help text for the option.
    protected string _help;

    // Default value for the option
    protected string _default = null;

    // An array of choices for the option.
    protected string[] _choices;

    // The prompt string
    protected string _prompt = null;

    // Is the option required.
    protected bool _isRequired;
    // Check if this option is required
    bool isRequired() {
        return _isRequired;
    }

    // Check if this option is a boolean option
    // Is the option a boolean option. Boolean options do not consume a parameter.
    protected bool _isBooleanOption;
    bool isBoolean() {
        return _isBooleanOption;
    }

    // Check if this option accepts multiple values.
    // Can the option accept multiple value definition.
    protected bool _acceptsMultiple;
    bool acceptsMultiple() {
        return _acceptsMultiple;
    }

    // Make a new DInput Option
    this(
        string optionName,
        string newShortAlias = "",
        string helpText = "",
        bool isBooleanOption = false,
        string defaultValue = null,
        string[] validChoices = null,
        bool acceptsMultiple = false,
        bool isRequiredOption = false,
        string promptText = null
    ) {
        _name = name;
        _shortAlias = newShortAlias;
        _help = helpText;
        _isBooleanOption = isBooleanOption;
        _choices = validChoices;
        /* acceptsMultiple(acceptsMultiple); */
        _isRequired = isRequiredOption;
        _prompt = promptText;

        /* if (isBooleanOption) {
           _default =/* (bool)  * /defaultValue != "true";
        } else if (!defaultValue.isNull) {
           _default = to!string(defaultValue);
        } */
        /* if (_shortalias.length > 1) {
            throw new DConsoleException(
                "Short option `%s` is invalid, short options must be one letter.".format(_shortalias)
           );
        }
        if (_default !is null && _prompt) {
            throw new DConsoleException(
                "You cannot set both `prompt` and `default` options. " ~
                "Use either a static `default` or interactive `prompt`"
           );
        } */
    }

    /**
     * Generate the help for this this option.
     * Params:
     * int width The width to make the name of the option.
     */
    string help(int width = 0) {
        string defaultHelpText;
        /* if (_default && _default != true) {
            defaultHelpText = " <comment>(default: %s)</comment>".format(_default);
        }
        if (_choices) {
            defaultHelpText ~= " <comment>(choices: %s)</comment>".format(_choices.join("|"));
        }

        string shortAliasname;
        if (!shortAliasname.isEmpty) {
            shortValue= ", -" ~ shortAliasname;
        }
        
        string name = "--%s%s".format(_name, shortAliasname);
        if (name.length < width) {
            name = str_pad(name, width, " ");
        }
        
        string required = _required 
            ? " <comment>(%s)</comment>".format(_required)
            : "";

        return "%s%s%s%s".format(name, _help, defaultHelpText, required); */
        return null;
    }

    // Get the usage value for this option
    string usage() {
        /* name = _shortalias is null ? "--" ~ _name : "-" ~ _shortalias;
        string defaultText = "";
        if (!_default.isNull && !isBoolean(_default) && !_default.isEmpty) {
            defaultText = " " ~ _default;
        }
        if (_choices) {
            defaultText = " " ~ join("|", _choices);
        }

        string templateText = 
            isRequired()
            ? "%s%s" : "[%s%s]";

        return templateText.format(name, defaultText); */
        return null;
    }

    // Get the default value for this option
    string defaultValue() {
        /* return _default; */
        return null;
    }

    // Check that a value is a valid choice for this option.
    bool validChoice(string aValue) {
        if (_choices.isEmpty) {
            return true;
        }
        /* if (!isIn(aValue, _choices, true)) {
            throw new DConsoleException(
                "`%s` is not a valid value for `--%s`. Please use one of `%s`"
                    .format(to!string(aValue), _name, join(", ", _choices))
            );
        } */
        return true;
    }

    // Get the list of choices this option has.
    Json[string] choices() {
        /* return _choices; */
        return null;
    }

    // Get the prompt string
    string prompt() {
        /* return to!string(_prompt); */
        return null;
    }

    // Append the option`s XML into the parent.
    /* DSimpleXMLElement xml(DSimpleXMLElement parent) {
        auto option = parent.addChild("option");
        option.addAttribute("name", "--" ~ _name);
        
        string shortAlias = !_shortalias.isEmpty
            ? "-" ~ _shortalias
            : "";

        auto defaultValue = _default;
        if (!defaultValue.isEmpty) {
            defaultValue = "true";
        } else if (defaultValue.isEmpty) {
            defaultValue = "false";
        }
        option.addAttribute("short", shortAlias);
        option.addAttribute("help", _help);
        option.addAttribute("boolean", to!string(to!int(_isBooleanOption)));
        option.addAttribute("required", to!string(/* (int * /_required));
        option.addChild("default", to!string(defaultValue));
        choices = option.addChild("choices");
        _choices.each!(valid => choices.addChild("choice", valid));
        return parent;
    }  */
}
