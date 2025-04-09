/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.commands.classes.consoles.scanner;

import uim.commands;
@safe:

mixin(Version!"test_uim_commands");

import uim.commands;
@safe:

/**
 * Used by CommandCollection and CommandTask to scan the filesystem
 * for command classes.
 *
 * @internal
 */
class DCommandScanner {
    mixin TConfigurable;

    this() {
        initialize;
    }

    this(Json[string] initData) {
        initialize(initData);
    }

    bool initialize(Json[string] initData = null) {
        configuration(MemoryConfiguration);
        configuration.setEntries(initData);

        return true;
    }

    mixin(TProperty!("string", "name"));
    /**
     * Scan UIM internals for shells & commands.
     *
     * returns A list of command metadata.
     */
    Json[string] scanCore() {
        /* return _scanDir(
            dirname(__DIR__) ~ DIR_SEPARATOR ~ "Command" ~ DIR_SEPARATOR,
            "UIM\Command\\",
            "",
            ["command_list"]
       ); */
        return null;
    }

    // Scan the application for shells & commands.
    Json[string] scanApp() {
        auto appNamespace = configuration.getEntry("App.namespace");

        /* return _scanDir(
            App.classPath("Command")[0],
            appNamespace ~ "\\Command\\",
            "",
            []
       ); */
        return null;
    }

    // Scan the named plugin for shells and commands
    Json[string] scanPlugin(string pluginName) {
        /* if (!Plugin.isLoaded(pluginName)) {
            return null;
        }
        string classPath = Plugin.classPath(pluginName);
        string namespace = pluginName.replacen("/", "\\");
        string prefix = pluginName.underscore ~ ".";

        return _scanDir(classPath ~ "Command", namespace ~ "\\Command\\", prefix, [
            ]); */
        return null;
    }

    // Scan a directory for .d files and return the class names that should be within them.
    protected Json[string] scanDir(string directoryPath, string shellNamespace, string commandPrefix, string[] commandsToHide) {
        if (!isDir(directoryPath)) {
            return null;
        }
        // This ensures `Command` class is not added to the list.
        commandsToHide ~= "";

        string classnamePattern = "/Command\\.d$/";
        // auto fs = new DFilesystem();
        /* /** @var array<\SplFileInfo> files * /
        auto files = fs.find(somePath, classnamePattern); */

        Json[string] commands = null;
        /* foreach (fileInfo; files) {
            auto file = fileInfo.getFilename();

            string name = to!string(preg_replace(classnamePattern, "", file)).underscore;
            if (commandsToHide.hasValue(name)) {
                continue;
            }
            
            string classname = namespace ~ fileInfo.getBasename(".d");
            if (!isSubclass_of(classname, ICommand.classname)) {
                continue;
            }
            
            auto reflection = new DReflectionClass(classname);
            if (reflection.isAbstract()) {
                continue;
            }
            if (isSubclass_of(classname, BaseCommand.classname)) {
                name = classname.defaultName();
            }
            commands[somePath ~ file] = [
                "file": somePath ~ file,
                "fullName": commandPrefix ~ name,
                "name": name,
                "class": classname,
            ];
        } */
        // ksort(commands);

        return commands; //.values;
    }
}
