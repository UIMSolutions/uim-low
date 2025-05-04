module uim.i18n.factories.catalog;

mixin(Version!"test_uim_i18n");

import uim.i18n;
@safe:

class DMessageCatalogFactory : DObjectFactory!DMessageCatalog {
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