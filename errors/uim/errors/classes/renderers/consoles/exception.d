/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.classes.renderers.consoles.exception;

import uim.errors;
@safe:

version (test_uim_errors) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}


/**
 * Plain text exception rendering with a stack trace.
 *
 * Useful in CI or plain text environments.
 */
class DConsoleExceptionRenderer { // }: IExceptionRenderer {
    private Throwable _error;

    /* private DOutput _output; */

    private bool _trace;

    /* this(Throwable errorToRender, IServerRequest serverRequest, Json[string] errorHandlingData) {
        _error = error;
        // TODO this.output = configuration.get("stderr") ?? new DOutput("d://stderr");
        _trace = configuration.getBoolean("trace", true);
    } */

    // Render an exception into a plain text message.
    string render() {
/*         auto exceptions = [_error];
        auto previous = _error.getPrevious();
        while (!previous.isNull) {
            exceptions ~= previous;
            previous = previous.getPrevious();
        } */

        string[] results;
/*         foreach (index, error; exceptions) {
            parent = index > 0 ? exceptions[index - 1] : null;
            results = chain(result, this.renderException(error, parent));
        } */
        return results.join("\n");
    }

    // Render an individual exception
    protected Json[string] renderException(DException exception, DException parentException) {
        /* auto result = [
            "<error>%s[%s] %s</error> in %s on line %s"
            .format(
                parent ? "Caused by " : "",
                exceptionToRender.classname,
                exceptionToRender.message(),
                exceptionToRender.getFile(),
                exceptionToRender.getLine()
            ),
        ]; */

        // auto debugValue = configuration.get("debug");
/*         if (debugValue && cast(DException) exceptionToRender) {
            auto attributes = exceptionToRender.getAttributes();
            if (attributes) {
                result ~= "";
                result ~= "<info>Exception Attributes</info>";
                result ~= "";
                result ~= var_export_(exceptionToRender.getAttributes(), true);
            }
        } */
/*         if (_trace) {
            auto stacktrace = Debugger.getUniqueFrames(exceptionToRender, parentException);
            result ~= "";
            result ~= "<info>Stack Trace:</info>";
            result ~= "";
            result ~= Debugger.formatTrace(stacktrace, ["format": "text"]);
            result ~= "";
        } */
        // return result;
        return null; 
    }

    /**
     * Write output to the output stream
     * Params:
     * \Psr\Http\Message\IResponse|string aoutput The output to print.
     */
    // TODO void write(IResponse aoutput) {
    void write(string outputText) {
        // _output.write(outputText);
    }
}
