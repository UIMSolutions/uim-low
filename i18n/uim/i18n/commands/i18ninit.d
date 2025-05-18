/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.i18n.classes.i18n.i18ninit;

mixin(Version!"test_uim_commands");

import uim.i18n;
@safe:

// Command for interactive I18N management.
class DI18nInitCommand : DCommand {
  mixin(CommandThis!("I18nInit"));

  static string defaultName() {
    return "i18n-init";
  }

  override bool execute(Json[string] arguments, IConsole console = null) {
    /*         auto myLanguage = commandArguments.getArgument("language");
        if (myLanguage.isNull) {
            myLanguage = console.ask(
                "Please specify language code, e.g. `en`, `eng`, `en_US` etc.");
        }
        if (myLanguage.length < 2) {
            console.writeErrorMessages(
                "Invalid language code. Valid is `en`, `eng`, `en_US` etc.");

            return false;
        } */

    /*         auto somePaths = App.path("locales");
        if (arguments.hasKey("plugin")) {
            plugin = arguments.getString("plugin").camelize;
            somePaths = [
                Plugin.path(
                    plugin) ~ "resources" ~ DIR_SEPARATOR ~ "locales" ~ DIR_SEPARATOR
            ];
        } */

    /*         string response = console.ask("What folder?", stripRight(somePaths[0], DIR_SEPARATOR) ~ DIR_SEPARATOR);
        string sourceFolder = stripRight(response, DIR_SEPARATOR) ~ DIR_SEPARATOR;
        string targetFolder = sourceFolder ~ myLanguage ~ DIR_SEPARATOR;
 */ /*         if (!isDir(targetFolder)) {
            createFolder(targetFolder, 0770, true);
        } */
    /*         size_t countFiles = 0;
        auto anIterator = new DirectoryIterator(sourceFolder);
        anIterator
            .filter!(fileInfo => fileInfo.isFile())
            .each!((fileInfo) {
                string filename = fileInfo.getFilename();
                string newFilename = fileInfo.getBasename(".pot") ~ ".po";

                auto content = file_get_contents(sourceFolder ~ filename);
                if (content == false) {
                    throw new DException(
                        "Cannot read file content of `%s`".format(sourceFolder ~ filename));
                }
                aConsole.createFile(targetFolder ~ newFilename, content);
                countFiles++;
            });
        console.writeln("Generated " ~ countFiles ~ " PO files in " ~ targetFolder);
 */
    return true;
  }

  /**
     * Gets the option parser instance and configures it.
     * Params:
     * \UIM\Console\DConsoleOptionParser buildOptionParser  aParser The parser to update
     */
  /* DConsoleOptionParser buildOptionParser(DConsoleOptionParser aParser) {
        aParser.description("Initialize a language PO file from the POT file")
            .addOption("plugin", [
                    "help": "The plugin to create a PO file in.",
                    "short": "p",
                ])
            .addArgument("language", [
                    "help": "Two-letter language code to create PO files for.",
                ]);

        return aParser;
    } */
}
