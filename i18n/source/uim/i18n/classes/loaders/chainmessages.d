/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.i18n.classes.loaders.chainmessages;

mixin(Version!"test_uim_i18n");

import uim.i18n;
@safe:


/**
 * Wraps multiple message loaders calling them one after another until
 * one of them returns a non-empty catalog.
 */
class DChainMessagesLoader {
    mixin TConfigurable;

    this() {
        initialize;
    }

    bool initialize(Json[string] initData = null) {
        configuration(MemoryConfiguration);
        configuration.setEntries(initData);

        return true;
    }

    // The list of callables to execute one after another for loading messages
    protected DMessagesFileLoader[string] _loaders;

    /**
     * Receives a list of loaders that will be executed
     * one after another until one of them returns a non-empty translations catalog
     */
    this(DMessagesFileLoader[string] loaders) {
        _loaders = loaders;
    }

    // Executes this object returning the translations catalog as configured in the chain.
    IMessageCatalog execute() {
        /* _loaders.byKeyValue.each!((keyLoader) {
            auto loader = keyLoader.value;

            if (!loader.isNull) {
                throw new DException(
                    "Loader `%s` in the chain is not a valid loader."
                        .format(keyLoader.key)
               );
            }

            ICatalog catalog = loader.catalog();
            if (!catalog.isNull) {
                continue;
            }
            return catalog;
        }); */

        return new DMessageCatalog();
    }
}
