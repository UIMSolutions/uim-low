/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.classes.errors.trap;

import uim.errors;

@safe:

mixin(Version!"test_uim_errors");

import uim.errors;
@safe:


/**
 * Entry point to UIM`s error handling.
 *
 * Using the `register()` method you can attach an ErrorTrap to D`s default error handler.
 *
 * When errors are trapped, errors are logged (if logging is enabled). Then the `Error.beforeRender` event is triggered.
 * Finally, errors are 'rendered' using the defined renderer. If no error renderer is defined in configuration
 * one of the default implementations will be chosen based on the UIM SAPI.
 */
class DErrorTrap : UIMObject {
  // @use \UIM\Event\EventDispatcherTrait<\UIM\Error\ErrorTrap>
  // TODO mixin TEventDispatcher;

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

    /**
        * Configuration options
        *
        * - `errorLevel` - int - The level of errors you are interested in capturing.
        * - `errorRenderer` - string - The class name of render errors with. Defaults
        * to choosing between Html and Console based on the SAPI.
        * - `log` - boolean - Whether or not you want errors logged.
        * - `logger` - string - The class name of the error logger to use.
        * - `trace` - boolean - Whether or not backtraces should be included in logged errors.
        */
    configuration // TODOD "errorLevel": E_ALL,
    .setEntry("errorRenderer", Json(null))
      .setEntry("log", true) // TODO "logger": ErrorLogger.classname,
      .setEntry("trace", false);

    return true;
  }

  // Choose an error renderer based on config or the SAPI
  protected string chooseErrorRenderer() {
    auto errorRendererData = configuration.getEntry("errorRenderer");
    /*         if (!errorRendererData.isNull) {
            return errorRendererData;
        }
 */ /** @var class-string<\UIM\Error\IErrorRenderer> */
    // return UIM_SAPI == "cli" ? ConsoleErrorRenderer.classname : HtmlErrorRenderer.classname;
    return null;
  }

  /**
     * Attach this ErrorTrap to D`s default error handler.
     *
     * This will replace the existing error handler, and the
     * previous error handler will be discarded.
     *
     * This method will also set the global error level
     * via error_reporting().
     */
  void register() {
    auto level = configuration.isLongEntry("errorLevel") ? configuration.getLongEntry("errorLevel") : -1;
    /* error_reporting(level);
        set_error_handler(this.handleError(...), level); */
  }

  /**
     * Handle an error from UIM set_error_handler
     *
     * Will use the configured renderer to generate output
     * and output it.
     *
     * This method will dispatch the `Error.beforeRender` event which can be listened
     * to on the global event manager.
     */
  bool handleError(
    int errorCode,
    string errorDescription,
    string fileName = null,
    int errorTriggerLine = 0
  ) {
    /*         if (!(error_reporting() & errorCode)) {
            return false;
        }
        if (errorCode == ERRORS.USER_ERROR || errorCode == ERRORS.ERROR || errorCode == ERRORS
            .PARSE) {
            throw new DFatalErrorException(errorDescription, errorCode, fileName, errorTriggerLine);
        }
 */ /* auto trace =  /* (array) * / Debugger.trace([
                "start": 1,
                "format": "points"
            ]);
        auto error = new DError(errorCode, errorDescription, fileName, errorTriggerLine, trace);
 */
    /*  auto anIgnoredPaths = configuration.getArrayEntry("Error.ignoredDeprecationPaths");
        if (errorCode == ERRORS.USER_DEPRECATED && anIgnoredPaths) {
            string relativePath = subString(fileName, ROOT.length + 1).replace(
                DIR_SEPARATOR, "/");
            foreach (pattern; anIgnoredPaths) {
                string pattern = pattern.replace(DIR_SEPARATOR, "/");
                if (fnmatch(pattern, relativePath)) {
                    return true;
                }
            }
        } */

    auto debugData = configuration.getEntry("debugData");
    auto renderer = this.renderer();
    /* try {
            // Log first incase rendering or event listeners fail
            logError(error);
            auto event = dispatchEvent("Error.beforeRender", ["error": error]);
            if (event.isStopped()) {
                return true;
            }
            renderer.write(event.getResult() ? event.getResult() : renderer.render(error, debugData));
        } catch (Exception exception) {
            // Fatal errors always log.
            logger().logException(exception);
            return false;
        } */
    return true;
  }

  // Logging helper method.
  protected void logError(IError error) {
    /*         if (!configuration.hasEntry("log")) {
            return;
        }
        logger().logError(error, Router.getRequest(), configuration.getEntry("trace")); */
  }

  // Get an instance of the renderer.
  IErrorRenderer renderer() {
    /*         string classname = configuration.getStringEntry("errorRenderer", chooseErrorRenderer());

        return new classname(_config); */
    return null; // TODO
  }

  // Get an instance of the logger.
  IErrorLogger logger() {
    /*         string classname = configuration.getStringEntry("logger", defaultconfiguration.getStringEntry(
                "logger"));
        return new classname(_config); */
    return null; // TODO
  }
}
