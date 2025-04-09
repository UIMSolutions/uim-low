module uim.consoles.factories.output;

import uim.consoles;
@safe:

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:


class DOutputFactory : DFactory!DOutput{}

auto OutputFactory() {
    return DOutputFactory.factory;
}

unittest {
    assert(OutputFactory);
    assert(OutputFactory.create("standard").name == "StandardOutput");
    assert(OutputFactory.create("file").name == "FileOutput");
    assert(OutputFactory.create("rest").name == "RestOutput");
}
 