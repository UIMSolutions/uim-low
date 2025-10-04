/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.tests.logger;

import uim.logging;
mixin(Version!"test_uim_logging");

@safe:

bool testLogger(ILogger logger) {
    assert(logger !is null, "testLogger: logger is null");
    
    return true;
}
