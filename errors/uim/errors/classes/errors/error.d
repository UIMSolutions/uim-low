module uim.errors.classes.errors.error;

import uim.errors;

@safe:

version (test_uim_errors) {
    unittest {
        writeln("-----  ", __MODULE__, "\t  -----");
    }
}

// This class is used to represent errors in UIM applications.
class DError : UIMObject, IError {
    mixin(ErrorThis!());

    override bool initialize(Json[string] initData = null) {
        if (!super.initialize(initData)) {
            return false;
        }

        // Map error codes to error levels.
        _levelMap = _levelMap.merge([
            "ERROR": "error", // Fatal run-time errors. These indicate errors that can not be recovered from, such as a memory allocation problem. Execution of the script is halted.
            "WARNING": "warning", // Run-time warnings (non-fatal errors). Execution of the script is not halted.
            "PARSE": "error", // Compile-time parse errors. Parse errors should only be generated by the parser.
            "NOTICE": "notice",
            "CORE_ERROR": "error",
            "CORE_WARNING": "warning",
            "COMPILER_ERROR": "error", // ERRORS.COMPILER_ERROR - 
            "COMPILER_WARNING": "warning", // ERRORS.COMPILER_WARNING
            "USER_ERROR": "error", // ERRORS.USER_ERROR
            "USER_WARNING": "warning",
            "RECOVERABLE_ERROR": "warning",
            "USER_NOTICE": "notice",
            "STRICT": "strict",
            "DEPRECATED": "deprecated",
            "USER_DEPRECATED": "deprecated",
        ]);

        // Map error levels to log levels.
        _logMap = [
            "error": LogLevels.ERROR,
            "warning": LogLevels.WARNING,
            "notice": LogLevels.TRACE,
            "strict": LogLevels.TRACE,
            "deprecated": LogLevels.TRACE,
        ];

        return true;
    }

    // #region levelMap
    protected string[string] _levelMap;
    // #endregion levelMap

    // #region logMap
    protected LogLevels[string] _logMap;
    // #endregion logMap

    // #region label
    // Get the error code
    protected string _code;
    string code() {
        return _code;
    }
    IError code(string newCode) {
        _code = newCode;
        return this;
    }
    // #endregion code

    // #region label
    // Get the error code label
    string label() {
        return _levelMap.get(code, "error");
    }
    // #endregion label

    // #region logLevel
    // Get the mapped LOG_ constant.
    LogLevels logLevel() {
        return _logMap.get(label(), LogLevels.ERROR);
    }
    // #endregion logLevel

    // #region line
    string line() {
        return to!string(_lineNumber);
    }
    // #endregion line

    // #region message
    protected string _message;
    // Get the error message.
    string message() {
        return _message;
    }

    // Set the error message.
    IError message(string newMessage) {
        _message = newMessage;
        return this;
    }
    // #endregion message

    // #region filemname
    protected string _fileName;
    // Get the filename.
    string fileName() {
        return _fileName;
    }

    // Set the filename.
    IError fileName(string name) {
        _fileName = name;
        return this;
    }
    // #endregion filemname

    // #region lineNumber
    protected size_t _lineNumber;
    size_t lineNumber() {
        return _lineNumber;
    }
    IError lineNumber(size_t newLineNumber) {
        _lineNumber = newLineNumber;
        return this;
    }
    // #endregion lineNumber

    // #region trace
    // Get the stacktrace.
    protected STRINGAA[] _trace;
    STRINGAA[] trace() {
        return _trace;
    }
    IError trace(STRINGAA[] newTrace) {
        _trace = newTrace;
        return this;
    }
    // Add a trace entry.
    IError addTrace(STRINGAA[] newTrace) {
        _trace ~= newTrace;
        return this;
    }
    // Add a trace entry.
    IError addTrace(string reference, string file, string line) {  
        STRINGAA newTrace;
        newTrace["reference"] = reference;
        newTrace["file"] = file;
        newTrace["line"] = line;
        addTrace(newTrace);

        return this;
    }
    // Add a trace entry.
    IError addTrace(STRINGAA newTrace) {
        _trace ~= newTrace;
        return this;
    }

    // Get the stacktrace as a string.
    string traceAsString() {
        return trace
            .map!(entry => "{%s} {%s, %s}".format(
                entry["reference"], 
                entry["file"], 
                entry["line"]))
            .join("\n");
    }
    // #endregion trace

}

unittest {
    auto error = new DError();
    assert(error !is null);

    assert(error.initialize());
    assert(error.label() == "error");
    assert(error.logLevel() == LogLevels.ERROR);
    assert(error.message == null);
    assert(error.fileName == null);
    assert(error.lineNumber == 0);
    assert(error.trace() == null);
    assert(error.traceAsString() == null);

    error.message = "This is a test message";
    assert(error.message == "This is a test message");
    assert(error.label() == "error");
    assert(error.logLevel() == LogLevels.ERROR);
    assert(error.fileName == null);
    assert(error.lineNumber == 0);
    assert(error.trace() == null);
    assert(error.traceAsString() == null);

    error.fileName = "test.d";
    assert(error.message == "This is a test message");
    assert(error.label() == "error");
    assert(error.logLevel() == LogLevels.ERROR);
    assert(error.fileName == "test.d");
    assert(error.lineNumber == 0);
    assert(error.trace() == null);
    assert(error.traceAsString() == null);

    error.lineNumber = 42;
    assert(error.message == "This is a test message");
    assert(error.label() == "error");
    assert(error.logLevel() == LogLevels.ERROR);
    assert(error.fileName == "test.d");
    assert(error.lineNumber == 42);
    assert(error.trace() == null);
    assert(error.traceAsString() == null);
}
