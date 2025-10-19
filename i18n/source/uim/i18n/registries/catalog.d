/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.i18n.registries.catalog;

mixin(Version!"test_uim_i18n");

import uim.i18n;
@safe:


class DMessageCatalogRegistry : DObjectRegistry!DMessageCatalog {
}

auto MessageCatalogRegistration() {
    return DMessageCatalogRegistry.registration;
}

unittest {
    // TODO: Test the registration of the message catalog.
}