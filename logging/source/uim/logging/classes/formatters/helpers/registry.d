/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.formatters.helpers.registry;

import uim.logging;

@safe:

class DLogFormatterRegistry : DObjectRegistry!DLogFormatter {
    mixin(RegistryThis!("LogFormatter"));
}
mixin(RegistryCalls!("LogFormatter"));

unittest {
  auto registry = LogFormatterRegistry;
  assert(registry !is null);

  assert(testRegistry(registry, "LogFormatter"), "Test LogFormatterRegistry failed");
}
