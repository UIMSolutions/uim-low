/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.classes.error.file;

import uim.consoles;
@safe:

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:


class DFileErrorOutput : DErrorOutput {
  mixin(ErrorOutputThis!("File"));
}
mixin(ErrorOutputCalls!("File"));

unittest {
  auto output = FileErrorOutput();
  assert(testErrorOutput(output));

  assert(output.name == "FileErrorOutput");
}