/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.exceptions.exception;

import uim.errors;

@safe:

// Base error exception.
class DErrorsException : DException {
  mixin(ExceptionThis!("Errors"));

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    messageTemplate("default", "Exception in libary uim-errors");

    return true;
  }
}

mixin(ExceptionCalls!("Errors"));

unittest {
  testException(ErrorsException);
}
