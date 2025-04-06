/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.commands.classes.plugins.assets.copy;

import uim.commands;

@safe:

// Command for copying plugin assets to app`s webroot.
class DPluginAssetsCopyCommand : DCommand {
    mixin(CommandThis!("PluginAssetsCopy"));

    mixin TPluginAssets;

    override bool initialize(Json[string] initData = null) {
        if (!super.initialize(initData)) {
            return false;
        }

        return true;
    }

    static string defaultName() {
        return "plugin-assets-copy";
    }

    override bool execute(Json[string] arguments, IConsole consoleIo) {
        /* return super.execute(arguments, consoleIo); */
        return true;
    }

    // Get the option parser.
    /* TODO override */
    /* DConsoleOptionParser buildOptionParser(DConsoleOptionParser parserToUpdate) {
        // TODO parserToUpdate.description("Copy plugin assets to app`s webroot.");

        /* 
        parserToUpdate.addArgument("name", MapHelper.create!(string, Json)
            .set("help", "A specific plugin you want to copy assets for.")
            .set("required", false)
        );
        
        parserToUpdate.addOption("overwrite", MapHelper.create!(string, Json)
            .set("help", "Overwrite existing symlink / folder / files.")
            .set("default", false)
            .set("boolean", true)
        ); * /

        return parserToUpdate;
    } */

    /**
     * Copying plugin assets to app`s webroot. For vendor namespaced plugin,
     * parent folder for vendor name are created if required.
     */
    /* bool execute(Json[string] arguments, IConsole consoleIo) {
        _io = consoleIo;
        _args = arguments;

        auto name = arguments.getString("name");
        auto shouldOverwrite = arguments.getBoolean("overwrite");
        _process(_list(name), true, shouldOverwrite);

        return true;
    } */
}

mixin(CommandCalls!("PluginAssetsCopy"));
