/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.classes.errors.logger;

import uim.errors;
@safe:

version (test_uim_errors) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

// Log errors and unhandled exceptions to `UIM\Log\Log`
class DErrorLogger : UIMObject, IErrorLogger {
    this() {
        initialize;
    }

    this(Json[string] initData) {
        initialize(initData);
    }

    override bool initialize(Json[string] initData = null) {
        if (!super.initialize(initData)) {
            return false;
        }

        configuration.setEntry("trace", false); // `trace` = Should error logs include stack traces?        
        return true;
    }

    /* void logError(IError error, IServerRequest serverRequest = null, bool anIncludeTrace = false) {
        auto errorMessage = error.message();
        if (request) {
            errorMessage ~= getRequestContext(request);
        }
        if (anIncludeTrace) {
            errorMessage ~= "\nTrace:\n" ~ error.traceAsString() ~ "\n";
        }
        /* label = error.label();
        level = match (label) {
            "strict": LogLevels.trace,
            "deprecated": LogLevels.debug__,
            default: label,
        };

        Log.write(level, errorMessage); * /
    } */

    /* void logException(
        Throwable exception,
        IServerRequest serverRequest = null,
        bool anIncludeTrace = false
    ) {
        exceptionMessage = message(exception, false, anIncludeTrace);

        if (!request.isNull) {
            exceptionMessage ~= getRequestContext(request);
        }
        Log.error(exceptionMessage);
    } */

    // Generate the message for the exception
    protected string message(Throwable exceptionToLog, bool isPrevious = false, bool includeTrace = false) {
        /*         string message = "%s[%s] %s in %s on line %s"
            .format(
                isPrevious ? "\nCaused by: " : "",
                exceptionToLog.classname,
                exceptionToLog.message(),
                exceptionToLog.getFile(),
                exceptionToLog.getLine()
           );

        debug = configuration.getEntry("debug");
 */
        /*         if (debug && cast(DException)exceptionToLog) {
            attributes = exceptionToLog.getAttributes();
            if (attributes) {
                message ~= "\nException Attributes: " ~ varexport_(exceptionToLog.getAttributes(), true);
            }
        }
 */
        /* if (includeTrace) {
            trace = Debugger.formatTrace(exceptionToLog, ["format": "points"]);
            assert(trace.isArray);
            message ~= "\nStack Trace:\n";
            trace.each!((line) {
                message ~= isString(line)
                    ? "- " ~ line
                    : "- {line["file"]}:{line["line"]}\n";
            });
        }
 */
        /*  auto previousException = exceptionToLog.getPrevious();
        if (previousException) {
            message ~= message(previousException, true,  includeTrace);
        }
        return message; */
        return null;
    }

    // Get the request context for an error/exception trace.
    /* string getRequestContext(IServerRequest request) {
        // TODO  string message = "\nRequest URL: " ~ request.getRequestTarget();

        /*  referer = request.getHeaderLine("Referer");
        if (referer) {
            message ~= "\nReferer URL: " ~ referer;
        }
        if (cast(DServerRequest)request) {
            clientIp = request.clientIp();
            if (clientIp && clientIp != ".1") {
                message ~= "\nClient IP: " ~ clientIp;
            }
        }
        return message; * /
        return null;
    } */
}
