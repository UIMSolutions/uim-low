/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.classes.renderers.error;

import uim.errors;
@safe:

version (test_uim_errors) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

class DErrorRenderer : UIMObject, IErrorRenderer {
    mixin(ErrorRendererThis!());

    override bool initialize(Json[string] initData = null) {
        if (!super.initialize(initData)) {
            return false;
        }

        return true;
    }
    
    // Render output for the provided error.
    string render(IError error, bool shouldDebug) {
        return null; 
    }

    // Write output to the renderer`s output stream
  IErrorRenderer write(string outputText) {
    // writeln(outputText);
    return this;
  }
}
