/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.caches.registries.engine;

import uim.caches;

@safe:

// An object registry for cache engines.
class DCacheEngineRegistry : DObjectRegistry!DCacheEngine {
}

auto CacheEngineRegistry() { // Singleton
  return DCacheEngineRegistry.registration;
}
