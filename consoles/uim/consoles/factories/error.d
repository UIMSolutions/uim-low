module uim.consoles.factories.error;

import uim.consoles;

@safe:

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:


class DErrorOutputFactory : DFactory!DErrorOutput {
}

auto ErrorOutputFactory() {
  return DErrorOutputFactory.factory;
}

unittest {
  assert(ErrorOutputFactory);
  assert(ErrorOutputFactory.create("standard").name == "StandardErrorOutput");
  assert(ErrorOutputFactory.create("file").name == "FileErrorOutput");
  assert(ErrorOutputFactory.create("rest").name == "RestErrorOutput");
}
