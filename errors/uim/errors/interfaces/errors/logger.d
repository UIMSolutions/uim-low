/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.interfaces.errors.logger;

import uim.errors;
@safe:

version (test_uim_errors) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

// Used by the ErrorHandlerMiddleware and global error handlers to log exceptions and errors.
interface IErrorLogger {
    // Log an error for an exception with optional request context.
    /* void logException(
        Throwable exception,
        IServerRequest currentRequest = null,
        bool anIncludeTrace = false
    );

    // Log an error to uim`s Log subsystem
    void logError(
        IError errorToLog,
        IServerRequest serverRequest = null,
        bool shouldLogIncludeTrace = false
    ); */
}
