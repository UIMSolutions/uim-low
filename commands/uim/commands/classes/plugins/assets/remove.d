/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.commands.classes.plugins.assets.remove;

import uim.commands;

@safe:

// Command for removing plugin assets from app`s webroot.
class DPluginAssetsRemoveCommand : DCommand {
  mixin(CommandThis!("PluginAssetsRemove"));
  /* mixin TPluginAssets;
 */
  static string defaultName() {
    return "plugin-assets-remove";
  }

  // Remove plugin assets from app`s webroot.
  /* override bool execute(Json[string] arguments, IConsole consoleIo) {
    _io = consoleIo;
    _args = arguments;

    auto name = arguments.getArgument("name");
    plugins = _list(name);

    plugins.byKeyValue
      .each!((pluginConfigData) {
        _io.writeln();
        _io.writeln("For plugin: " ~ pluginconfiguration.key);
        _io.hr();

        _removeKey(pluginconfiguration.value);
      });
    _io.writeln();
    _io.writeln("Done");

    return true;
  } */

  // Get the option parser.
  /* DConsoleOptionParser buildOptionParser(DConsoleOptionParser parser) {
    parser.description("Remove plugin assets from app`s webroot.");

    parser.addArgument("name", MapHelper.create!(string, Json)
        .set("help", "A specific plugin you want to remove.")
        .set("required", false)
    );

    return parser;
  } */
}

mixin(CommandCalls!("PluginAssetsRemove"));

unittest {
}
