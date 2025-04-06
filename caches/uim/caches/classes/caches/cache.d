module uim.caches.classes.caches.cache;

import uim.caches;

@safe:

/**
 * Cache provides a consistent interface to Caching in your application. It allows you
 * to use several different Cache engines, without coupling your application to a specific
 * implementation. It also allows you to change out cache storage or configuration without effecting
 * the rest of your application.
 *
 * ### Configuring Cache engines
 *
 * You can configure Cache engines in your application`s `Config/cache.d` file.
 * A sample configuration would be:
 *
 * ```
 * Cache.config("shared", [
 *  'classname": UIM\Cache\Engine\ApcuEngine.classname,
 *  'prefix": '_app_'
 * ]);
 * ```
 *
 * This would configure an APCu cache engine to the `shared' alias. You could then read and write
 * to that cache alias by using it for the `configName` parameter in the various Cache methods.
 *
 * In general all Cache operations are supported by all cache engines.
 * However, Cache.increment() and Cache.decrement() are not supported by File caching.
 *
 * There are 7 built-in caching engines:
 *
 * - `ApcuEngine` - Uses the APCu object cache, one of the fastest caching engines.
 * - `ArrayEngine` - Uses only memory to store all data, not actually a persistent engine.
 *  Can be useful in test or CLI environment.
 * - `FileEngine` - Uses simple files to store content. Poor performance, but good for
 *  storing large objects, or things that are not IO sensitive. Well suited to development
 *  as it is an easy cache to inspect and manually flush.
 * - `MemcacheEngine` - Uses the PECL.Memcache extension and Memory for storage.
 *  Fast reads/writes, and benefits from memcache being distributed.
 * - `RedisEngine` - Uses redis and D-redis extension to store cache data.
 * - `XcacheEngine` - Uses the Xcache extension, an alternative to APCu.
 */
class DCache : UIMObject, ICache {
  mixin(CacheThis!());

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    // An array mapping URL schemes to fully qualified caching engine class names.
    /* _dsnClassMap = [
            /* "array": ArrayCacheEngine.classname,
            "apcu": ApcuCacheEngine.classname,
            "file": FileCacheEngine.classname, * /
            "memcached": MemoryCacheEngine.classname,
            "memory": MemoryCacheEngine.classname,
            "null": NullCacheEngine.classname,
            /* "redis": RedisCacheEngine.classname, * /
        ];
        */
    return true;
  }

  // An array mapping URL schemes to fully qualified caching engine class names.
  protected static STRINGAA _dsnClassMap;

  // #region enable
  // Flag for tracking whether caching is enabled.
  protected static bool _enabled = true;
  // Re-enable caching.
  static void enable() {
    _enabled = true;
  }

  // Disable caching.
  static void disable() {
    _enabled = false;
  }

  // Check whether caching is enabled.
  static bool enabled() {
    return _enabled;
  }
  // #endregion enable

  // Group to Config mapping
  protected static Json _groups = null;

  // Cache Registry used for creating and using cache adapters.
  protected static DCacheRegistry _registry;

  // Returns the Cache Registry instance used for creating and using cache adapters.
  static DCacheRegistry getRegistry() {
    return _registry ? _registry : new DCacheRegistry();
  }

  /**
     * Sets the Cache Registry instance used for creating and using cache adapters.
     * Also allows for injecting of a new registry instance.
     * /
    static void setRegistry(DCacheRegistry cacheRegistry) {
        _registry = cacheRegistry;
    }

    // Finds and builds the instance of the required engine class.
    protected  /* static * / void _buildEngine(string configName) {
        auto myRegistry = getRegistry();

        // TODO 
        /*        if (configuration.isEmptyEntry(configName~".classname")) {
            throw new DInvalidArgumentException(
                "The `%s` cache configuration does not exist."
                .format(configName)
           );
        } * /

        auto configData = configuration.getEntry(configName);
        // TODO 
        /*        try {
            myRegistry.load(configName, configData);
        } catch (RuntimeException exception) {
            if (!hasKey("fallback", configData)) {
                myRegistry.set(configName, new DNullEngine());
                trigger_error(exception.message(), ERRORS.USER_WARNING);

                return;
            }
            if (!configuration.hasEntry("fallback")) {
                throw exception;
            }
            if (configuration.getStringEntry("fallback") == configName) {
                throw new DInvalidArgumentException(
                    "`%s` cache configuration cannot fallback to it"
                    .format(configName), 0, exception);
            }
            auto myfallbackEngine = pool(configuration.getEntry("fallback")).clone;
            assert(cast(DCacheEngine)myfallbackEngine);

            configuration
                    .merge("groups", Json.emptyArray) 
                    .merge("prefix", "");

            myfallbackEngine.configuration.setEntry("groups", mynewConfig["groups"], false);
            if (mynewConfig["prefix"]) {
                myfallbackEngine.configuration.setEntry("prefix", mynewConfig["prefix"], false);
            }
            myRegistry.set(configName, myfallbackEngine);
        } */
  /*        if (cast(DCacheEngine)configuration.getEntry("classname")) {
            configData = configuration.getEntry("classname").configuration.data;
        } */
  /*        if (!configuration.isEmptyEntry("groups")) {
            (cast(DArrayData)configuration.getEntry("groups")).values.each!((groupName) {
                _groups[groupName).concat( configName;
                _groups.set(groupName, _groups[groupName].unique);
                _groups[groupName].sort;
            });
        }  * /
    }

    // Get a SimpleCacheEngine object for the named cache pool.
    /* static ICache&ICacheEngine pool(string configName) {
        if (!_enabled) {
            return new DNullEngine();
        }
        myRegistry = getRegistry();

        if (myRegistry.{configName} !is null) {
            return myRegistry.{configName};
        }
        _buildEngine(configName);

        return myRegistry.{configName};
    } */

  /**
     * Write data for key into cache.
     *
     * ### Usage:
     *
     * Writing to the active cache config:
     *
     * ```
     * Cache.write("cached_data", mydata);
     * ```
     *
     * Writing to a specific cache config:
     *
     * ```
     * Cache.write("cached_data", mydata, "long_term");
     * ```
     * /
    static bool write(string key, Json dataToCache, string configName = "default") {
        // TODO 
        /*        if (isResource(dataToCache)) {
            return false;
        } */
  /* auto mybackend = pool(configName);
        auto wasSuccessful = mybackend.set(key, dataToCache);
        if (!wasSuccessful && dataToCache != "") {
            throw new DCacheWriteException(
                "%s cache was unable to write '%s' to %s cache"
                .format(
                    configName,
                    key,
                    get_class(mybackend)
           ));
        }
        return wasSuccessful; * /
        return false;
    }

    /**
     * Write data for many keys into cache.
     *
     * ### Usage:
     *
     * Writing to the active cache config:
     *
     * ```
     * Cache.writeMany(["cached_data_1": 'data 1", "cached_data_2": 'data 2"]);
     * ```
     *
     * Writing to a specific cache config:
     *
     * ```
     * Cache.writeMany(["cached_data_1": 'data 1", "cached_data_2": 'data 2"], "long_term");
     * ```
     */
  /* static bool writeMany(Json[data] dataToStore, string configName = "default") {
        return pool(configName).set(dataToStore);
    } */

  /**
     * Read a key from the cache.
     *
     * ### Usage:
     *
     * Reading from the active cache configuration.
     *
     * ```
     * Cache.read("_data");
     * ```
     *
     * Reading from a specific cache configuration.
     *
     * ```
     * Cache.read("_data", "long_term");
     * ```
     */
  /* static Json read(string key, string configName = "default") {
        return pool(configName).get(key);
    } */

  /**
     * Read multiple keys from the cache.
     *
     * ### Usage:
     *
     * Reading multiple keys from the active cache configuration.
     *
     * ```
     * Cache.readMany(["_data_1", "_data_2]);
     * ```
     *
     * Reading from a specific cache configuration.
     *
     * ```
     * Cache.readMany(["_data_1", "_data_2], "long_term");
     * ```
     * /
    static Json readMany(string[] keysToFetch, string configName = "default") {
        return Json(null);
        // TODO return pool(configName).items(keysToFetch);
    }

    // Increment a number under the key and return incremented value.
    /* static int|false increment(string key, int incValue = 1, string configName = "default") {
        if (incValue < 0) {
            throw new DInvalidArgumentException("Offset cannot be less than `0`.");
        }
        return pool(configName).increment(key, incValue);
    } */

  // Decrement a number under the key and return decremented value.
  /* static long decrement(string itemKey, int decValue = 1, string configName = "default") {
        if (decValue < 0) {
            throw new DInvalidArgumentException("Offset cannot be less than `0`.");
        }
        return pool(configName).decrement(itemKey, decValue);
    } */

  /**
     * Delete a key from the cache.
     *
     * ### Usage:
     *
     * Deleting from the active cache configuration.
     *
     * ```
     * Cache.removeKey("_data");
     * ```
     *
     * Deleting from a specific cache configuration.
     *
     * ```
     * Cache.removeKey("_data", "long_term");
     * ```
     */
  /* static bool removeKey(string key, string configName = "default") {
        return pool(configName).removeKey(key);
    } */

  /**
     * Delete many keys from the cache.
     *
     * ### Usage:
     *
     * Deleting multiple keys from the active cache configuration.
     *
     * ```
     * Cache.deleteMany(["_data_1", "_data_2"]);
     * ```
     *
     * Deleting from a specific cache configuration.
     *
     * ```
     * Cache.deleteMany(["_data_1", "_data_2], "long_term");
     * ```
     * /
    static bool deleteMany(string[] someKeys, string configName = "default") {
        // TODO return pool(configName).removeKey(someKeys);
        return false;
    }

    /**
     * Delete all keys from the cache.
     * Params:
     * returns True if the cache was successfully cleared, false otherwise
     * /
    static bool clear(string configName = "default") {
        // TODO return pool(configName).clear();
        return false;
    }

    /**
     * Delete all keys from the cache from all configurations.
     *
     * Status code. For each configuration, it reports the status of the operation
     * /
    static bool[string] clearAll() {
        bool[string] mystatus;

        // TODO configured().each!(configName => mystatus[configName] = clear(configName));

        return mystatus;
    }

    // Delete all keys from the cache belonging to the same group.
    static bool clearGroup(string groupName, string configName = "default") {
        // TODO return pool(configName).clearGroup(groupName);
        return false;
    }

    /**
     * Retrieve group names to config mapping.
     *
     * ```
     * Cache.config("daily", ["duration": '1 day", "groups": ["posts"]]);
     * Cache.config("weekly", ["duration": '1 week", "groups": ["posts", "archive"]]);
     * configDatas = Cache.groupConfigs("posts");
     * ```
     *
     * configDatas will equal to `["posts": ["daily", "weekly"]]`
     * Calling this method will load all the configured engines.
     * Params:
     * string groupName Group name or null to retrieve all group mappings
     */
  /* static Json[string] groupConfigs(string groupName = null) {
        configured()
            .each!(configName => pool(configName));

        if (groupName.isNull) {
            return _groups;
        }
        if (_groups.hasKey(groupName)) {
            return [groupName: _groups[groupName]];
        }
        throw new DInvalidArgumentException("Invalid cache group `%s`.".format(groupName));
    } */

  /**
     * Provides the ability to easily do read-through caching.
     *
     * If the key is not set, the default callback is run to get the default value.
     * The results will then be stored into the cache config
     * at key.
     *
     * Examples:
     *
     * Using a Closure to provide data, assume `this` is a Table object:
     *
     * ```
     * results = Cache.remember("all_articles", auto () {
     *    return _find("all").toJString();
     * });
     * ```
     * Params:
     * string aKey The cache key to read/store data at.
     * the cache key is empty.
     */
  /* static Json remember(string aKey, IClosure callbackWhenEmpty, string configName = "default") {
        auto myexisting = read(aKey, configName);
        if (myexisting) {
            return myexisting;
        }
        
        Json results = callbackWhenEmpty();
        write(aKey, results, configName);

        return results;
    } */

  /**
     * Write data for key into a cache engine if it doesn`t exist already.
     *
     * ### Usage:
     *
     * Writing to the active cache config:
     *
     * ```
     * Cache.add("cached_data", mydata);
     * ```
     *
     * Writing to a specific cache config:
     *
     * ```
     * Cache.add("cached_data", mydata, "long_term");
     * ```
     * /
    static bool add(string key, Json dataToCache, string configName = "default") {
        // TODO
        /* if (isResource(dataToCache)) {
            return false;
        }
        return pool(configName).add(key, dataToCache); * /
        return false;
    }
    */
}
