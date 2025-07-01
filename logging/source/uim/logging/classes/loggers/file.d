/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.logging.classes.loggers.file;

mixin(Version!"test_uim_logging");

import uim.logging;

@safe:

/**
 * File Storage stream for Logging. Writes logs to different files
 * based on the level of log it is.
 */
class DFileLogger : DLogger {
  mixin(LoggerThis!("File"));

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }
    /**
     * Default config for this class
     *
     * - `levels` string or array, levels the engine is interested in
     * - `scopes` string or array, scopes the engine is interested in
     * - `file` Log file name
     * - `path` The path to save logs on.
     * - `size` Used to implement basic log file rotation. If log file size
     * reaches specified size the existing file is renamed by appending timestamp
     * to filename and new log file is created. Can be integer bytes value or
     * human readable string values like "10MB", "100KB" etc.
     * - `rotate` Log files are rotated specified times before being removed.
     * If value is 0, old versions are removed rather then rotated.
     * - `mask` A mask is applied when log files are created. Left empty no chmod
     * is made.
     * - `dirMask` The mask used for created folders.
     *
     */
    configuration
      .setEntries(["path", "file", "types", "fileMask"], Json(null))
      .setEntries(["levels", "scopes"], Json.emptyArray)
      .setEntry("rotate", 10)
      .setEntry("size", 10_485_760)
      .setEntry("dirMask", 770)
      .setEntry("formatter", StandardLogFormatter.toJson);

    auto logPath = configuration.hasEntry("Path") ? configuration.getStringEntry("path") : tempDir() ~ "logs/";
    if (!existsFolder(logPath)) {
      createFolder(logPath/* , configuration.getEntry("dirMask") */);
    }
    if (!configuration.isEmptyEntry("file")) {
      _filename = configuration.getStringEntry("file");
      if (_filename.extension.empty) {
        _filename ~= ".log";
      }
    }
    /* if (!configuration.isEmptyEntry("size")) {
      _maxFileSize = isNumeric(configuration.getEntry("size"))
        ? configuration.toLong("size") : Text.parsegetSize(configuration.getEntry("size"));
    } */

    return true;
  }

  // #region logPath
  // Path to save log files on.
  protected string _logPath;
  string logPath() {
    return _logPath;
  }

  ILogger logPath(string newPath) {
    _logPath = newPath;
    return this;
  }
  // #endregion logPath

  // #region fileName
  // The name of the file to save logs into.
  protected string _filename = null;
  // The name of the file to save logs into.
  string fileName() {
    return _filename;
  }

  ILogger fileName(string newName) {
    _filename = newName;
    return this;
  }

  // The name of the loglevel file to save logs into.
  string logLevelFileName(string logLevel) {
    if (!_filename.isEmpty) {
      return _filename;
    }

    string[] debugTypes = ["notice", "info", "debug"];
    if (logLevel == "error" || logLevel == "warning") {
      return "error.log";
    } else if (debugTypes.hasValue(logLevel)) {
      return "debug.log";
    }
    return logLevel ~ ".log";
  }
  // #endregion fileName

  // #region maxFileSize
  // Max file size, used for log file rotation.
  protected int _maxFileSize = 0; // If size is 0, no rotation is made.

  // Get the max file size.
  int maxFileSize() {
    return _maxFileSize;
  };

  // Set the max file size.
  ILogger maxFileSize(int newMaxSize) {
    _maxFileSize = newMaxSize;
    return this;
  };

  unittest {
    auto logger = new DFileLogger;
    assert(logger.maxFileSize == 0);

    logger.maxFileSize(1024);
    assert(logger.maxFileSize == 1024);

    logger.maxFileSize(0);
    assert(logger.maxFileSize == 0);
  }
  // #endregion maxFileSize

  // #region log
  // writing to log files.
  /* override void log(int logLevel, string messageToLog, Json[string] contextValues = null) {
    string message = interpolate(messageToLog, contextValues);
    message = _formatter.format(logLevel, message, contextValues);

    string filename = fileName(logLevel);
    if (maxFileSize > 0) {
      // Rotate the file if it is too big.
      rotateFile(filename);
    }

    string filePath = logPath ~ filename;
    if (existsFile(filePath)) {
      appendToFile(filePath, message ~ "\n");
    } else {
      // Create the file with the specified mask.
      createFile(filePath);
      appendToFile(filePath, message ~ "\n");
      if (!configuration.isEmptyEntry("fileMask")) {
        chmod(filePath, octal!(configuration.getLongEntry("fileMask")));
      }
      if (!configuration.isEmptyEntry("dirMask")) {
        chmod(logPath, octal!(configuration.getLongEntry("dirMask")));
      }
    }
  } */

  override ILogger log(string logLevel, string logMessage, Json[string] logContext = null) {
    return this;
  }
  // #endregion log

  // Rotate log file if size specified in config is reached.
  protected void rotateFile(string filename) {
    string logFilepath = logPath ~ filename;

    if (!logFilepath.isFile || getSize(logFilepath) < _maxFileSize) {
      return; // do nothing
    }

    rename(logFilepath, "%s.%s".format(logFilepath, toTimestamp(now())));
    createFile(logFilepath);
  }
}

mixin(LoggerCalls!("File"));

unittest {
  auto logger = new DFileLogger;
  assert(testLogger(logger));
}
