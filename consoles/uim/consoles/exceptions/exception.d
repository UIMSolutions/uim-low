/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.exceptions.exception;

import uim.consoles;
@safe:

version (test_uim_consoles) {
    unittest {
        writeln("-----  ", __MODULE__, "\t  -----");
    }
}

// Exception class for Console libraries. This exception will be thrown from Console library classes when they encounter an error.
class DConsoleException : DException {
  mixin(ExceptionThis!("Console"));

  protected int _defaultCode; // = DCommand.false;
  protected int _exceptionCode;
  protected Throwable _previousException;

/*   this(
    string message, int exceptionCode = 0, Throwable previousException = null
  ) {
    super(message);
    _exceptionCode = exceptionCode;
    _previousException = previousException;
  } */
}

mixin(ExceptionCalls!("Console"));

unittest {
  testException(ConsoleException);
}
