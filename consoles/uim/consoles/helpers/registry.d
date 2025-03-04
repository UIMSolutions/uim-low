/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.helpers.registry;

import uim.consoles;
@safe:

version (test_uim_consoles) {
    unittest {
        writeln("-----  ", __MODULE__, "\t  -----");
    }
}

/**
 * Registry for Helpers. Provides features
 * for lazily loading helpers.
 *
 * @extends \UIM\Core\ObjectRegistry<\UIM\Console\Helper>
 */
class DConsoleHelperRegistry : UIMObject { // }: ObjectRegistry {
    this() {
        super();
    }

    this(Json[string] initData) {
        super(initData);
    }

    /* 
    // IO instance.
    protected IConsole _io;

    // Sets The IO instance that should be passed to the shell helpers
    void setIo(IConsole aConsole) {
        _io = aConsole;
    }

    /**
     * Resolve a helper classname.
     * Part of the template method for {@link \UIM\Core\ObjectRegistry.load()}.
     */
    protected string _resolveclassname(string classname) {
        /* return App.classname(classname, "Command/Helper", "Helper"); */
        return null;
    }

    /**
     * Throws an exception when a helper is missing.
     *
     * Part of the template method for UIM\Core\ObjectRegistry.load()
     * and UIM\Core\ObjectRegistry.unload()
     */
    protected void _throwMissingClassError(string classname, string pluginName) {
        /* throw new DMissingHelperException(MapHelper.create!(string, Json)
            .set("class", classname)
            .set("plugin", pluginName)
        ); */
    }

    /**
     * Create the helper instance.
     * Part of the template method for UIM\Core\ObjectRegistry.load()
     */
    // TODO protected DHelper _create(object obj, string helperAlias, Json[string] initData) {

    /*     protected DHelper _create(string classnameToCreate, string helperAlias, Json[string] initData) {
        return new classname(_io, initData);
    }  */
}
