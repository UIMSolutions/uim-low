module uim.i18n.registries.formatter;

mixin(Version!"test_uim_i18n");

import uim.i18n;
@safe:

class DFormatterRegistry : DObjectRegistry!DI18NFormatter {
}

auto FormatterRegistry() {
  return DFormatterRegistry.registration;
}

unittest {
  // TODO: Test the registration of the formatter.
}
