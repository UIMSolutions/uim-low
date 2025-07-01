module uim.i18n.registries.parser;

mixin(Version!"test_uim_i18n");

import uim.i18n;
@safe:

class DParserRegistry : DObjectRegistry!DParser {
}

auto ParserRegistry() {
    return DParserRegistry.registration;
}