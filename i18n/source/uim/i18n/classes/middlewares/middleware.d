module uim.i18n.classes.middlewares.middleware;

import uim.i18n;
@safe:

mixin(Version!"test_uim_i18n");

import uim.i18n;
@safe:


class DI18NMiddleware : UIMObject, II18NMiddleware {
    mixin(I18NMiddlewareThis!());
}

unittest {
    // TODO DI18NMiddleware
}