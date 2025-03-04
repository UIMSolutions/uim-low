/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.i18n.classes.loaders.messagesfile;

import uim.i18n;
@safe:

version (test_uim_i18n) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

/**
 * A generic translations catalog factory that will load translations files
 * based on the file extension and the catalog name.
 *
 * This class is a callable, so it can be used as a catalog loader argument.
 */
class DMessagesFileLoader : UIMObject {
    this() {
        super();
    }

    // The catalog (domain) name.
    protected string _name;

    // The catalog (domain) plugin
    protected string _plugin = null;

    // The locale to load for the given catalog.
    protected string _locale;

    // The extension name.
    protected string _extension;

    /**
     * Loads the translation file and parses it. Returns an instance of a translations
     * catalog containing the messages loaded from the file.
     */
    IMessageCatalog catalog() {
        auto folders = translationsFolders();
        auto file = translationFile(folders, _name, _extension);
        if (file.isEmpty) { // No file to load
            return null;
        }
        // ...
        return null; // TODO
    }

    /**
     * Returns the folders where the file should be looked for according to the locale
     * and catalog name.
     */
    string[] translationsFolders() {
        return null; // TODO 
    }

    protected string translationFile(string[] folders, string fileName, string fileExtension) {
        fileName = fileName.replace("/", "_");
        foreach(folder; folders) {
            string filePath = folder ~ fileName ~ "." ~ fileExtension;
            if (filePath.isFile) {
                return filePath;
                // TODO ist always false because "_";
            }
        }

        return null;
    }
    /**
     * Creates a translation file loader. The file to be loaded corresponds to
     * the following rules:
     *
     * - The locale is a folder under the `resources/locales/` directory, a fallback will be
     * used if the folder is not found.
     * - The name corresponds to the file name to load
     * - If there is a loaded plugin with the underscored version of name, the
     * translation file will be loaded from such plugin.
     *
     * ### Examples:
     *
     * Load and parse resources/locales/fr/validation.po
     *
     * ```
     * loader = new DMessagesFileLoader("validation", "fr_FR", "po");
     * catalog = loader();
     * ```
     *
     * Load and parse resources/locales/fr_FR/validation.mo
     *
     * ```
     * loader = new DMessagesFileLoader("validation", "fr_FR", "mo");
     * catalog = loader();
     * ```
     *
     * Load the plugins/MyPlugin/resources/locales/fr/_plugin.po file:
     *
     * ```
     * loader = new DMessagesFileLoader("_plugin", "fr_FR", "mo");
     * catalog = loader();
     *
     * Vendor prefixed plugins are expected to use `_prefix__plugin` syntax.
     * ```
     */
    this(string domainName, string localToLoad, string fileExtension = "po") {
        this();
        _name = domainName;
        // If space is not added after slash, the character after it remains lowercased

        /* auto pluginName = Inflector.camelize(_name.replace("/", "/ "));
        if (indexOf(_name, ".")) {
            [_plugin, _name] = pluginSplit(pluginName);
        } else if (Plugin.isLoaded(pluginName)) {
            _plugin = pluginName;
        }
        _locale = localToLoad;
        _extension = fileExtension; */
    }

    /* DMessageCatalog catalog() {
        // ..
        /* 

        string name = capitalize(_extension);
        auto classname = App.classname(name, "I18n\Parser", "FileParser");
        if (!classname) {
            throw new DException("Could not find class `%s`.".format("{name}FileParser"));
        }

        auto object = Object.factory(classname);
        auto messages = object.parse(file); * /
        // auto catalog = new DMessageCatalog("default");
        // TODOD auto catalog.setMessages(messages); 

        // return catalog;
        return null;
    } */

    /* string[] translationsFolders() {
        /* auto locale = Locale.parseLocale(_locale) ~ ["region": Json(null)];

        auto folders = [
            [locale["language"], locale["region"]].join("_"),
            locale["language"],
        ]; * /

        string[] searchPaths;
        /* if (_plugin && Plugin.isLoaded(_plugin)) {
            basePath = App.path("locales", _plugin)[0];
            searchPaths = folders.map!(folder => basePath ~ folder ~ DIRECTORY_SEPARATOR).array;
        } */

        /* auto localePaths = App.path("locales");
        if (localePaths.isEmpty && defined("APP")) {
            localePaths ~= ROOT ~ "resources" ~ DIRECTORY_SEPARATOR ~ "locales" ~ DIRECTORY_SEPARATOR;
        } */
        /* foreach (localPath; localePaths) {
            folders.each!(folder => searchPaths ~= localPath ~ folder ~ DIRECTORY_SEPARATOR);
        } * /
        return searchPaths;
    } */
}