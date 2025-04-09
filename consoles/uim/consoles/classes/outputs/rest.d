/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt rest.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.classes.outputs.rest;

import uim.consoles;
@safe:

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:


class DRestOutput : DOutput {
  mixin(OutputThis!("Rest"));
}

mixin(OutputCalls!("Rest"));

unittest {
  auto output = RestOutput;
  assert(testOutput(output));
}

