/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.i18n.factories.catalog;

mixin(Version!"test_uim_i18n");

import uim.i18n;
@safe:

class DMessageCatalogFactory : DObjectFactory!IMessageCatalog {
    override DMessageCatalog create(string name) {
        return new DMessageCatalog(name);
    }
}

auto MessageCatalogFactory() {
    return DMessageCatalogFactory.factory;
}

static this() {
    // Init the factory for the message catalog.
    MessageCatalogFactory();
}