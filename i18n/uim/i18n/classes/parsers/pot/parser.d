module uim.i18n.classes.parsers.pot.parser;

import uim.i18n;
@safe:

mixin(Version!"test_uim_i18n");

import uim.i18n;
@safe:


class DPotI18NParser : DI18NParser {
    mixin(I18NParserThis!("Pot"));
}
mixin(I18NParserCalls!("Pot"));
