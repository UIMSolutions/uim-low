module uim.i18n.classes.middlewares.middleware;

import uim.i18n;
@safe:

version (test_uim_i18n) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

class DI18NMiddleware : UIMObject, II18NMiddleware {
    mixin(I18NMiddlewareThis!());
}

unittest {
    // TODO DI18NMiddleware
}