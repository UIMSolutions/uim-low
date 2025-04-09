module uim.consoles.factories.input;

import uim.consoles;
@safe:

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:


class DInputFactory : DFactory!DInput{}

auto InputFactory() {
    return DInputFactory.factory;
}

unittest {
    assert(InputFactory);
    assert(InputFactory.create("standard").name == "StandardInput");
    assert(InputFactory.create("file").name == "FileInput");
    assert(InputFactory.create("rest").name == "RestInput");
}


