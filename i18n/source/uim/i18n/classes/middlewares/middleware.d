/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.i18n.classes.middlewares.middleware;

import uim.i18n;

mixin(Version!"test_uim_i18n");

@safe:

class DI18NMiddleware : UIMObject, II18NMiddleware {
    mixin(I18NMiddlewareThis!());
}

unittest {
    // TODO DI18NMiddleware
}
