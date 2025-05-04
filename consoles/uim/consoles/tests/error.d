/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.tests.error;

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:



bool testErrorOutput(IErrorOutput output) {
    assert(output !is null, "In testErrorOutput: output is null");
    
    return true;
}