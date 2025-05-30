/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.caches.helpers.engine;

mixin(Version!"test_uim_caches");

import uim.caches;
@safe:

bool isEngine(Object instance) {
    if (cast(ICacheEngine) instance) {
        return true;
    }

    return false;
}
