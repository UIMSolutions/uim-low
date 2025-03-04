/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.classes.debugging.debugger;

import uim.errors;
@safe:

version (test_uim_errors) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

// Provide custom logging and error handling.
class DDebugger : UIMObject, IErrorDebugger {
  this() {
    super("Debugger");
  }

  this(Json[string] initData) {
    super("Debugger", initData);
  }

  this(string name, Json[string] initData = null) {
    super(name, initData);
  }

  // Hook method
  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    configuration
      .setDefault("outputMask", Json.emptyArray)
      .setDefault("exportFormatter", Json(null))
      .setDefault("editor", "vscode");

    _editors = [
      "atom": "atom://core/open/file?filename={file}&line={line}",
      "emacs": "emacs://open?url=file://{file}&line={line}",
      "macvim": "mvim://open/?url=file://{file}&line={line}",
      "sublime": "subl://open?url=file://{file}&line={line}",
      "textmate": "txmt://open?url=file://{file}&line={line}",
      "vscode": "vscode://file/{file}:{line}",
    ];

     _stringContents = null;

    Json[string] logMap; // These templates are not actually used, as Debugger.log() is called instead.
    logMap.set("trace", "{:reference} - {:path}, line {:line}");
    logMap.set("error", "{:error} ({:code}): {:description} in [{:file}, line {:line}]");
    _stringContents["log"] = logMap;

    Json[string] jsMap; 
    jsMap.set(["error", "info", "code", "dumpContext"], "");
    jsMap.set("trace", htmlDoubleTag("pre", ["stack-trace"], "{:trace}"));
    jsMap.set("links", Json.emptyArray);
    jsMap.set("escapeContext", true);
    _stringContents["js"] = jsMap;

    Json[string] htmlMap; 
    htmlMap.set("trace", htmlDoubleTag("pre", ["uim-error trace"], "<b>Trace</b> <p>{:trace}</p>"));
    htmlMap.set("dumpContext", htmlDoubleTag("pre", [
        "uim-error dumpContext"
      ], "<b>Context</b> <p>{:dumpContext}</p>"));
    htmlMap.set("escapeContext", true);
    _stringContents["html"] = htmlMap;

    Json[string] txtMap; 
    txtMap.set(["code", "info"], "");
    txtMap.set("error", "{:error}: {:code} . {:description} on line {:line} of {:path}\n{:info}");
    _stringContents["txt"] = txtMap;

    Json[string] baseMap; 
    baseMap.set("traceLine", "{:reference} - {:path}, line {:line}");
    baseMap.set("trace", "Trace:\n{:trace}\n");
    baseMap.set("dumpContext", "Context:\n{:dumpContext}\n");
    _stringContents["base"] = baseMap;

    return true;
  }

  // The current output format.
  protected string _outputFormat = "js";

  // A map of editors to their link templates.
  protected STRINGAA _editors;

  /**
     * Add an editor link format
     *
     * Template strings can use the `{file}` and `{line}` placeholders.
     * Closures templates must return a string, and accept two parameters:
     * The file and line.
     */
  static void addEditor(string editorName,  string templateText) {
    // getInstance().editors[editorName] = templateText;
  }
  /**
     * Templates used when generating trace or error strings. Can be global or indexed by the format
     * value used in _outputFormat.
     */
  protected Json[string][string] _stringContents;

  /**
     * Mapping for error renderers.
     *
     * Error renderers are replacing output formatting with
     * an object based system. Having Debugger handle and render errors
     * will be deprecated and the new DErrorTrap system should be used instead.
     */
  protected STRINGAA renderers; /*  = [
        "txt": TextErrorRenderer.classname,
        // The html alias currently uses no JS and will be deprecated.
        "js": HtmlErrorRenderer.classname,
    ]; */

  // A map of editors to their link templates.
  protected STRINGAA editors = [
    "atom": "atom://core/open/file?filename={file}&line={line}",
    "emacs": "emacs://open?url=file://{file}&line={line}",
    "macvim": "mvim://open/?url=file://{file}&line={line}",
    "Dstorm": "Dstorm://open?file={file}&line={line}",
    "sublime": "subl://open?url=file://{file}&line={line}",
    "textmate": "txmt://open?url=file://{file}&line={line}",
    "vscode": "vscode://file/{file}:{line}",
  ];

  // Choose the editor link style you want to use.
  static void setEditor(string editorName) {
    /* auto anInstance = getInstance();
    if (!anInstance.editors.hasKey(editorName)) {
      auto known = anInstance.editors.keys.join(", ");
      throw new DInvalidArgumentException(
        "Unknown editor `%s`. Known editors are `%s`."
          .format(editorName, known)
      );
    }
    anInstance.configuration.set("editor", name); */
  }

  /**
     * Get a formatted URL for the active editor.
     * Params:
     * string afile The file to create a link for.
     */
  static string editorUrl(string filename, int lineNumber) {
    /* auto anInstance = getInstance();
    auto editor = anInstance.configuration.get("editor");
    if (!anInstance.editors.hasKey(editor)) {
      throw new DInvalidArgumentException(
        "Cannot format editor URL `%s` is not a known editor."
          .format(editor));
    }
    auto templateText = anInstance.editors[editor];
    if (isString(templateText)) {
      return templateText.replace(["{file}", "{lineNumber}"], [
          filename, to!string(lineNumber)
        ]);
    }
    return templateText(file, lineNumber); */
    return null; 
  }
  /*
    //Holds current output data when outputFormat is false.
    protected Json[string] _data = null;

    this() {
        docRef = ini_get("docref_root");
        if (isEmpty(docRef) && function_hasKey("ini_set")) {
            ini_set("docref_root", "https://secure.d.net/");
        }
        if (!defined("ERRORS.RECOVERABLE_ERROR")) {
            define("ERRORS.RECOVERABLE_ERROR", 4096);
        }
        aConfig = intersectinternalKey(configuration.getArray("Debugger"), _defaultConfigData);
        configuration.set(aConfig);
    }
    
    // Returns a reference to the Debugger singleton object instance.
    /* static static getInstance(string classname = null) {
        /** @var array<int, static>  anInstance * /
        static anInstance = null;
        if (classname) {
            if (!anInstance || strtolower(classname) != get_class(anInstance[0]).lower) {
                anInstance[0] = new classname();
            }
        }
        if (!anInstance) {
            anInstance[0] = new Debugger();
        }
        return anInstance[0];
    } */

  /**
     * Read or write configuration options for the Debugger instance.
     * Params:
     * Json[string]|string key The key to get/set, or a complete array of configs.
     */
  static Json[string] nullInstance(string[] key = null, Json aValue = null, bool shouldMerge = true) {
    if (key.isNull) {
      // return getInstance().configuration.get(key);
    }

    /*         if (key.isArray || func_num_args() >= 2) {
            return getInstance().setConfig(key, aValue, shouldMerge);
        }
 */
    // return getInstance().configuration.get(key);
    return null;
  }

  // Reads the current output masking.
  static STRINGAA outputMask() {
    // return configInstance("outputMask");
    return null;
  }

  /**
     * Sets configurable masking of debugger output by property name and array key names.
     * ### Example
     * Debugger.setOutputMask(["password": '[*************]");
     */
  static void setOutputMask(Json[string] keyReplaceData, bool shouldMerge = true) {
    // configInstance("outputMask", keyReplaceData, shouldMerge);
  }

  // Recursively formats and outputs the contents of the supplied variable.
  static void dump(Json valueToDump, int maxOutputDepth = 3) {
    // pr(exportVar(valueToDump, maxOutputDepth));
  }

  /**
     * Creates an entry in the log file. The log entry will contain a stack trace from where it was called.
     * as well as export the variable using exportVar. By default, the log is written to the debug log.
     */
  static void log(Json varToLog, string levelType = "debug", int maxDepth = 3) {
    /* string source = trace(["start": 1]);
    source ~= "\n";

    Log.write(
      levelType,
      "\n" ~ source ~ exportVarAsPlainText(varToLog, maxDepth)
    ); */
  }

  // Get the frames from exception that are not present in parent
  static Json[string] getUniqueFrames(Throwable exception, Throwable parent) {
    /* if (parent.isNull) {
      return exception.getTrace();
    } */
    /* parentFrames = parent.getTrace();
    frames = exception.getTrace();

    parentCount = count(parentFrames) - 1;
    frameCount = count(frames) - 1; */

    // Reverse loop through both traces removing frames that
    // are the same.
/*     for (index = frameCount, p = parentCount; index >= 0 && p >= 0; p--) {
      parentTail = parentFrames[p];
      tail = frames[index];

      // Frames without file/line are never equal to another frame.
      isEqual = (
        (
          tail.hasAllKeys("file", "line") &&
          parentTail.hasAllKeys("file", "line")
      ) &&
        (tail["file"] == parentTail["file"]) &&
        (tail["line"] == parentTail["line"])
      );
      if (isEqual) {
        removeKey(frames[index]);
        index--;
      }
    }
    return frames; */
    return null; 
  }

  /**
     * Outputs a stack trace based on the supplied options.
     *
     * ### Options
     *
     * - `depth` - The number of stack frames to return. Defaults to 999
     * - `format` - The format you want the return. Defaults to the currently selected format. If
     *  format is 'array' or 'points' the return will be an array.
     * - `args` - Should arguments for functions be shown? If true, the arguments for each method call
     * will be displayed.
     * - `start` - The stack frame to start generating a trace from. Defaults to 0
     */
  static string[] trace(Json[string] options = null) {
    // Remove the frame for Debugger.trace()
    /* backtrace = debug_backtrace();
    backtrace.shift;

    return Debugger.formatTrace(backtrace, options); */
  
    return null;
  }

  /**
     * Formats a stack trace based on the supplied options.
     *
     * ### Options
     *
     * - `depth` - The number of stack frames to return. Defaults to 999
     * - `format` - The format you want the return. Defaults to 'text'. If
     *  format is 'array' or 'points' the return will be an array.
     * - `args` - Should arguments for functions be shown? If true, the arguments for each method call
     * will be displayed.
     * - `start` - The stack frame to start generating a trace from. Defaults to 0
     */
  static string[] formatTrace(Throwable backtrace, Json[string] options = null) {
    /* if (cast(Throwable) backtrace) {
      backtrace = backtrace.getTrace();
    }

    options
      .merge("depth", 999)
      .merge("format", "text")
      .merge("args", false)
      .merge("start", 0)
      .merge("scope", Json(null))
      .merge("exclude", ["call_user_func_array", "trigger_error"]); */

    /* auto count = count(backtrace) + 1;
    string[] back = null; */

/*     for (index = options.getLong("start"); index < count && index < options.getLong("depth");
      index++) {
      frame = ["file": "[main]", "line": ""];
      if (isSet(backtrace[index])) {
        frame = backtrace[index] ~ ["file": "[internal]", "line": "??"];
      }
      string signature = frame.getString("file");
      string reference = frame.getString("file");
      if (!frame.isEmpty("class")) {
        string signature = frame.getString("class") ~ frame.getString(
          "type") ~ frame.getString("function");
        string reference = signature ~ "(";
        if (options.hasKey("args") && frame.hasKey("args")) {
          reference ~= frame["args"].map!(arg => Debugger.exportVar(arg)).join(", ");
        }
        reference ~= ")";
      }
      if (isIn(signature, options.get("exclude"), true)) {
        continue;
      }

      if (options.getString("format") == "points") {
        back ~= [
          "file": frame("file"),
          "line": frame("line"),
          "reference": reference
        ];
      } else if (options.getString("format") == "array") {
        if (!options.hasKey("args")) {
          frame.removeKey("args");
        }
        back ~= frame;
      } else if (options.getString("format") == "text") {
        somePath = trimPath(frame["file"]);
        back ~= "%s - %s, line %d".format(reference, somePath, frame["line"]);
      } else {
        /* debug (options);
                throw new DInvalidArgumentException(
                    "Invalid trace format of `{options.get(\"format\"]}` chosen. Must be one of `array`, `points` or `text`."
               ); * /
      }
    }
    if (options.getString("format") == "array" || options.getString("format") == "points") {
      return back;
    } */
    // return back.join("\n");
    return null; 
  }

  // Shortens file paths by replacing the application base path with 'APP", and the UIM core path with 'CORE'.
  static string trimPath(string pathToShorten) {
    /* if (defined("APP") && pathToShorten.startsWith(APP)) {
      return pathToShorten.replace(APP, "APP/");
    }
    if (defined("uim_CORE_INCLUDE_PATH") && pathToShorten.startsWith(uim_CORE_INCLUDE_PATH)) {
      return pathToShorten.replace(uim_CORE_INCLUDE_PATH, "CORE");
    }
    return defined("ROOT") && pathToShorten.startsWith(ROOT)
      ? pathToShorten.replace(ROOT, "ROOT") : pathToShorten; */
    return null; 
  }

  /**
     * Grabs an excerpt from a file and highlights a given line of code.
     *
     * Usage:
     *
     * ```
     * Debugger.excerpt("/path/to/file", 100, 4);
     * ```
     *
     * The above would return an array of 8 items. The 4th item would be the provided line,
     * and would be wrapped in `<span class="code-highlight"></span>`. All the lines
     * are processed with highlight_string() as well, so they have basic UIM syntax highlighting
     * applied.
     */
  static string[] excerpt(string filePath, int lineToHighlight, int numberOfLinesToExtract = 2) {
    string[] lines = null;
    /* if (!filehasKey(filePath)) {
      return null;
    } */

    /* string[] contents = file_get_contents(filePath);
    if (contents.isEmpty) {
      return lines;
    }
    if (contents.contains("\n")) {
      contents = someData.split("\n");
    }
    lineToHighlight--;
    if (contents.isNull(lineToHighlight)) {
      return lines;
    } */

    /* for (index = lineToHighlight - numberOfLinesToExtract; index < lineToHighlight + numberOfLinesToExtract + 1;
      index++) {
      if (contents[index]!is null) {
        continue;
      }
      string lineToHighlight = _highlight(someData[index]).replace([
        "\r\n", "\n"
      ], "");
      lines ~= index == lineToHighlight
        ? htmlDoubleTag("span", ["code-highlight"], "string") : lineToHighlight;
    } */
    return lines;
  }

  /**
     * Wraps the highlight_string auto in case the server API does not
     * implement the auto as it is the case of the HipHop interpreter
     */
  protected static string _highlight(string stringToConvert) {
    /* if (function_hasKey("hD_log") || function_hasKey("hD_gettid")) {
      return htmlentities(stringToConvert);
    }

    bool added = false;
    if (!stringToConvert.contains("")) {
      added = true;
      stringToConvert = " \n" ~ stringToConvert;
    }

    string highlight = highlight_string(stringToConvert, true);
    if (added) {
      highlight = highlight.replace(
        ["&lt;?D&nbsp;<br/>", "&lt;?D&nbsp;<br />"],
        "");
    }
    return highlight; */
    return null; 
  }

  // Get the configured export formatter or infer one based on the environment.
  IErrorFormatter getExportFormatter() {
    /* auto anInstance = getInstance();
    string formatterClassname = anInstance.configuration.get("exportFormatter");
    if (!formatterClassname) {
      /*          if (DConsoleErrorFormatter.environmentMatches()) {
                formatterClassname = ConsoleErrorFormatter.classname;
            } else if (HtmlFormatter.environmentMatches()) {
                formatterClassname = HtmlErrorFormatter.classname;
            } else {
                formatterClassname = TextErrorFormatter.classname;
            } * /
    }

    /* anInstance = new formatterClassname();
        if (!cast(IErrorFormatter) anInstance) {
            throw new DException(
                "The `%s` formatter does not implement `%s`."
                    .format(formatterClassname, IErrorFormatter.classname)
            );
        }
        return anInstance; */
    return null;
  }

  /**
     * Converts a variable to a string for debug output.
     *
     * *Note:* The following keys will have their contents
     * replaced with `*****`:
     *
     * - password
     * - login
     * - host
     * - database
     * - port
     * - prefix
     * - schema
     *
     * This is done to protect database credentials, which could be accidentally
     * shown in an error message if UIM is deployed in development mode.
     */
  static string exportVar(Json value, int maxDepth = 3) {
    /* auto context = new DDebugContext(maxDepth);
    auto node = export_(value, context);

    return getInstance().getExportFormatter().dump(node); */
    return null; 
  }

  // Converts a variable to a plain text string.
  static string exportVarAsPlainText(Json value, int maxOutputDepth = 3) {
/*     return (new DTextFormatter()).dump(
      export_(value, new DDebugContext(maxOutputDepth))
    ); */
    return null; 
  }

  /**
     * Convert the variable to the internal node tree.
     *
     * The node tree can be manipulated and serialized more easily
     * than many object graphs can.
     */
  static IErrorNode exportVarAsNodes(Json value, int maxOutputDepth = 3) {
    // return export_(value, new DDebugContext(maxOutputDepth));
    return null; 
  }

  /**
     * Protected export auto used to keep track of indentation and recursion.
     * Params:
     * Json var The variable to dump.
     */
  /* protected static IErrorNode export_(Json valueToDump, DDebugContext context) {
    string type = getType(valueToDump);

    if (type.startsWith("resource ")) {
      return new DScalarErrorNode(type, valueToDump);
    }
    return null; // TODO 
    /* return match(type) {
            "float", "string", "null" : new DScalarErrorNode(type, valueToDump),
            "bool" : new DScalarErrorNode("bool", valueToDump),
            "int" : new DScalarErrorNode("int", valueToDump),
            "array" : exportArray(valueToDump, context.withAddedDepth()),
            "unknown" : new DSpecialErrorNode("(unknown)"),
            default : exportObject(valueToDump, context.withAddedDepth()),
        }; * /
  } */

  /**
     * Export an array type object. Filters out keys used in datasource configuration.
     *
     * The following keys are replaced with ***
     *
     * - password
     * - login
     * - host
     * - database
     * - port
     * - prefix
     * - schema
     */
  /* protected static DArrayErrorNode exportArray(Json[string] exportValues, DDebugContext dumpContext) {
    auto someItems = null;

    auto remaining = dumpContext.remainingDepth();
    if (remaining >= 0) {
      outputMask = outputMask();
      exportValues.byKeyValue((item) {
        if (hasKey(item.key, outputMask)) {
          node = new DScalarErrorNode("string", outputMask[item.key]);
        } else if (item.value != exportValues) {
          // Dump all the items without increasing depth.
          node = export_(item.value, dumpContext);
        } else {
          // Likely recursion, so we increase depth.
          node = export_(item.value, dumpContext.withAddedDepth());
        }
        someItems ~= new ArrayItemNode(export_(item.key, dumpContext), node);
      });
    } else {
      someItems ~= new ArrayItemNode(
        new DScalarErrorNode("string", ""),
        new DSpecialErrorNode("[maximum depth reached]")
      );
    }
    return new DArrayErrorNode(someItems);
  } */

  // Handles object to node conversion.
  /* protected static IErrorNode exportObject(UIMObject objToConvert, DDebugContext dumpContext) {
    /* auto isRef = dumpContext.hasReference(objToConvert);
        auto refNum = dumpContext.getReferenceId(objToConvert);

        auto objClassname = var.classname;
        if (isRef) {
            return new DReferenceErrorNode(classname, refNum);
        }

        auto node = new DClassErrorNode(classname, refNum);
        auto remaining = dumpContext.remainingDepth();
        if (remaining > 0) {
            if (hasMethod(objToConvert, "debugInfo")) {
                 try {
                    foreach (key, val; /* (array) * / objToConvert.debugInfo(string[] showKeys = null, string[] hideKeys = null)) {
                        node.addProperty(new DPropertyErrorNode("'{key}'", null, export_(val, dumpContext)));
                    }
                    return node;
                } catch (Exception anException) {
                    return new DSpecialErrorNode(
                        "(unable to export object: { anException.message()})");
                }
             }
            auto outputMask = outputMask();
            auto objectVars = get_object_vars(objToConvert);
            objectVars.byKeyValue
                .each!((kv) {
                    if (outputMask.hasKey(kv.key)) {
                        kv.value = outputMask[kv.key];
                    }
                    node.addProperty(
                        new DPropertyErrorNode((string) kv.key, "public", export_(kv.value, dumpContext.withAddedDepth()))
                   );
                });
            ref = new DReflectionObject(objToConvert);

            filters = [
                ReflectionProperty.IS_PROTECTED: "protected",
                ReflectionProperty.IS_PRIVATE: "private",
            ];
            foreach (filter, visibility; filters) {
                reflectionProperties = ref.getProperties(filter);
                foreach (reflectionProperty; reflectionProperties) {
                    reflectionProperty.setAccessible(true);

                    if (
                        hasMethod(reflectionProperty, "isInitialized") &&
                        !reflectionProperty.isInitialized(objToConvert)
                       ) {
                        aValue = new DSpecialErrorNode("[uninitialized]");
                    } else {
                        aValue = export_(reflectionProperty.value(objToConvert), dumpContext.withAddedDepth());
                    }
                    node.addProperty(
                        new DPropertyErrorNode(
                            reflectionProperty.name,
                            visibility,
                            aValue
                   )
                   );
                }
            }
        }
        return node; * /
    return null;
  } */

  // Get the type of the given variable. Will return the class name for objects.
  static string getType(Json variableToCheck) {
/*     string variableType = get_debug_type(variableToCheck);

    switch (variableType) {
    case "double":
      return "float";
    case "unknown type":
      return "unknown";
    default:
      return variableType;
    } */
    return null; 
  }

  // Prints out debug information about given variable.
  static void printVar(Json debugValue, Json[string] locationData = null, string showHtml = null) {
    /* auto locationData ~= ["file": Json(null), "line": Json(null)];
        if (locationData["file"]) {
            locationData["file"] = trimPath((string) locationData["file"]);
        }

        auto debugger = getInstance();
        auto restore = null;
        if (!showHtml.isNull) {
            restore = debugger.configuration.get("exportFormatter");
            debugger.configuration.set("exportFormatter", showHtml == "true" ? HtmlFormatter.classname
                    : TextFormatter.classname);
        }
        auto contents = exportVar(debugValue, 25);
        auto formatter = debugger.getExportFormatter();

        if (restore) {
            debugger.setConfig("exportFormatter", restore);
        }
        writeln(formatter.formatWrapper(contents, locationData)); */
  }

  /**
     * Format an exception message to be HTML formatted.
     *
     * Does the following formatting operations:
     *
     * - HTML escape the message.
     * - Convert `bool` into `<code>bool</code>`
     * - Convert newlines into `<br>`
     */
  static string formatHtmlMessage(string messageToFormat) {
    /* string message = htmlAttributeEscape(messageToFormat);
        message = (string) preg_replace("/`([^`]+)`/", "<code>0</code>", message);

        return nl2br(message); */
    return null;
  }

  // Verifies that the application`s salt and cipher seed value has been changed from the default value.
  static void checkSecurityKeys() {
/*     auto salt = Security.getSalt();
    if (salt == "__SALT__" || salt.length < 32) {
      trigger_error(
        "Please change the value of `Security.salt` in `ROOT/config/app_local.d` " ~
          "to a random value of at least 32 characters.",
          ERRORS.USER_NOTICE
      );
    } */
  }
  // Holds current output data when outputFormat is false.
  protected Json[string] _data = null;
  /* this() {
        auto docRef = ini_get("docref_root");
        if (docRef.isEmpty && function_hasKey("ini_set")) {
            ini_set("docref_root", "https://secure.D.net/");
        }
        if (!defined("ERRORS.RECOVERABLE_ERROR")) {
            define("ERRORS.RECOVERABLE_ERROR", 4096);
        }

        aConfig = intersectinternalKey( /* (array) * / Configure.read("Debugger"), _defaultConfig);
        configuration.set(aConfig);
        e = `<pre class="uim-error">`;
        e ~= `<a href="javascript:void(0);" onclick="document.getElementById(\"{:id}-trace\")`;
        e ~= `.style.display = (document.getElementById(\"{:id}-trace\").style.display == `;
        e ~= `\"none\" ? \"\" : \"none\");"><b>{:error}</b> ({:code})</a>: {:description} `;
        e ~= `[<b>{:path}</b>, line <b>{:line}</b>]`;
        e ~= htmlDoubleTag("div", "{:id}-trace", [
                "uim-stack-trace"
            ], ["style": "display: none;"], "{:links}{:info}");
        e ~= `</pre>`;
        _stringContents.set("js.error", e);
        t = `<div id="{:id}-trace" class="uim-stack-trace" style="display: none;">`;
        t ~= `{:dumpContext}{:code}{:trace}</div>`;
        _stringContents.set("js.info", t);

        Json[string] links;
        string link = "<a href=\"javascript:void(0);\" onclick=\"document.getElementById(\"{:id}-code\")";
        link ~= ".style.display = (document.getElementById(\"{:id}-code\").style.display == ";
        link ~= "\"none\" ? \"\" : \"none\")\">Code</a>";
        links.set("code", link);

        link = "<a href=\"javascript:void(0);\" onclick=\"document.getElementById(\"{:id}-dumpContext\")";
        link ~= ".style.display = (document.getElementById(\"{:id}-dumpContext\").style.display == ";
        link ~= "\"none\" ? \"\" : \"none\")\">Context</a>";
        links.set("dumpContext", link);

        _stringContents.set("js.links", links);
        _stringContents.set("js.dumpContext", htmlDoubleTag("pre", "{:id}-dumpContext", [
                    "uim-dumpContext", "uim-debug"
                ], ["style": "display: none;"], "{:dumpContext}"));
        _stringContents.set("js.code", htmlDoubleTag("pre", "{:id}-code", [
                    "uim-code-dump"
                ], ["style": "display: none;"], "{:code}"));
        _stringContents.set("html.error", htmlDoubleTag("pre", [
                    "uim-error"
                ],
                htmlDoubleTag("b", "{:error}") ~ "({:code}) : {:description} [<b>{:path}</b>, line <b>{:line}]</b>"));

        _stringContents.set("html.dumpContext", htmlDoubleTag("pre", [
                    "uim-dumpContext uim-debug"
                ],
                htmlDoubleTag("b", "Context") ~
                htmlDoubleTag("p", "{:dumpContext}")));
    } */

  // Returns a reference to the Debugger singleton object instance.
  static Object getInstance(string aclassname = null) {
    /* static instance = null;
    if (!aclassname.isEmpty) {
      if (!instance || strtolower(aclassname) != strtolower(
          get_class(instance[0]))) {
        instance[0] = new aclassname();
      }
    }
    if (!instance) {
      instance[0] = new Debugger();
    }

    return instance[0]; */
    return null; 
  }

  // Read or write configuration options for the Debugger instance.
  static Json configInstance(string key = null, Json valueToSet = null, bool shouldMerge = true) {
    /* if (key == null) {
      return getInstance().configuration.get(key);
    } */

    /* if (key.isArray || func_num_args() >= 2) {
      return getInstance().setConfig(key, valueToSet, shouldMerge);
    } */

    // return getInstance().configuration.get(key);
    return Json(null);
  }

  /**
     * Add an editor link format
     *
     * Template strings can use the `{file}` and `{line}` placeholders.
     * Closures templates must return a string, and accept two parameters:
     * The file and line.
     */

  /* static void addEditor(string editorName, string function(string filename, string line) templateNameFunc) {
    // addEditor(editorName, string templateName) {
  } */

/*   static void addEditor(string editorName, string templateName) {
    auto instance = getInstance();
    instance.editors[editorName] = templatenName;
  } */

  // Choose the editor link style you want to use.
  /*     static void setEditor(string editorName) {
        auto instance = getInstance();
        if (
            !instance.editors.hasKey(editorName)) {
            known = instance.editors.keys.join(", ");
            throw new DRuntimeException(
                "Unknown editor `{name}`. Known editors are {known}");
        }
        instance.configuration.set("editor", editorName);
    } */

  // Get a formatted URL for the active editor.
  /* static string editorUrl(string filename, int lineNumber) {
    auto instance = getInstance();
    auto editor = instance.getConfig(
      "editor");
    if (instance.editors.isNull(editor)) {
      throw new DRuntimeException(
        "Cannot format editor URL `{editor}` is not a known editor.");
    }

    auto templateText = instance.editors[editor];
    return templateText.isString
      ? templateText.mustache([
          "file": filename,
          "line": lineNumber
        ]) : templateText(filename, lineNumber);
  } */

  // #region outputMask
  // Reads the current output masking.
  /*     static STRINGAA outputMask() {
        return configInstance("outputMask");
    } */

  /**
     * Sets configurable masking of debugger output by property name and array key names.
     *
     * ### Example
     * Debugger.setOutputMask(["password": "[*************]");
     */
  static void outputMask(Json[string] keyvalues, bool shouldMerge = true) {
    // configInstance("outputMask", value, shouldMerge);
  }
  // #endregion outputMask

  // Recursively formats and outputs the contents of the supplied variable.
  /*     static void dump(Json dumpValue, int maxOutputDepth = 3) {
        pr(exportVar(dumpValue, maxOutputDepth));
    } */

  /**
     * Creates an entry in the log file. The log entry will contain a stack trace from where it was called.
     * as well as export the variable using exportVar. By default, the log is written to the debug log.
     */
  static void log(Json varToLog, string logLevel = "debug", size_t maxOutputDepth = 3) {
    // string source = trace(["start": 1]) ~ "\n";

    /* Log.write(
      logLevel,
      "\n" ~ source ~ exportVarAsPlainText(varToLog, maxOutputDepth)
    ); */
  }

  /**
     * Outputs a stack trace based on the supplied options.
     *
     * ### Options
     *
     * - `depth` - The number of stack frames to return. Defaults to 999
     * - `format` - The format you want the return. Defaults to the currently selected format. If
     *   format is "array" or "points" the return will be an array.
     * - `args` - Should arguments for functions be shown? If true, the arguments for each method call
     *  will be displayed.
     * - `start` - The stack frame to start generating a trace from. Defaults to 0
     */
  /* static auto trace(Json[string] formatOptions = null) {
        return Debugger.formatTrace(debug_backtrace(), formatOptions);
    } */

  /**
     * Formats a stack trace based on the supplied options.
     *
     * ### Options
     *
     * - `depth` - The number of stack frames to return. Defaults to 999
     * - `format` - The format you want the return. Defaults to the currently selected format. If
     *   format is "array" or "points" the return will be an array.
     * - `args` - Should arguments for functions be shown? If true, the arguments for each method call
     *  will be displayed.
     * - `start` - The stack frame to start generating a trace from. Defaults to 0
     */
  // static  /* array| */ string formatTrace(Throwable /* array */ backtrace, Json[string] options = null) {
  /* if (cast(Throwable) backtrace) {
            backtrace = backtrace.getTrace();
        }

        auto debugger = Debugger.getInstance();
        auto defaults = [
            "depth": 999,
            "format": _outputFormat,
            "args": false,
            "start": 0,
            "scope": null,
            "exclude": [
                "call_user_func_array",
                "trigger_error"
            ],
        ];
        auto options = options.defaults;

        auto count = count(backtrace);
        auto back = null;
        _trace = MapHelper.create!(string, Json)
            .set("line", "??")
            .set("file", "[internal]")
            .set("class", Json(null))
            .set("function", "[main]");

        for (i = options.getLong("start"); i < count && i < options.getLong(
                "depth"); i++) {
            auto trace = backtrace[i] + [
                "file": "[internal]",
                "line": "??"
            ];
            string signature = "[main]";
            string reference = "[main]";

            if (backtrace[i + 1]!is null) {
                next = backtrace[i + 1] + _trace;
                string signature = next["function"];
                string signature = reference;

                if (!next.isEmpty("class")) {
                    string signature = next.getString("class") ~ "." ~ next.getString("class") /*  "function") * / ;
                    auto reference = signature ~ "(";
                    if (options.isNull("args") && next.hasKey(
                            "args")) {
                        auto args = next["args"].map!(
                            arg => Debugger.exportVar(
                                arg)).array;
                        reference ~= args.join(
                            ", ");
                    }
                    reference ~= ")";
                }
            }
            if (hasAllValues(signature, options.getBoolean("exclude", true))) {
                continue;
            }

            auto formatValue = options.getString(
                "format");
            if (formatValue == "points") {
                back ~= [
                    "file": trace["file"],
                    "line": trace["line"],
                    "reference": reference
                ];
            } else if (formatValue == "array") {
                if (!options.hasKey("args")) {
                    trace.removeKey("args");
                }
                back ~= trace;
            } else {
                formatValue = options.getString(
                    "format");
                tpl = _stringContents.path([
                        formatValue,
                        "traceLine"
                    ], _stringContents.path([
                            "base",
                            "traceLine"
                        ]));
            }
            trace.set("path", trimPath(trace["file"]));
            trace.set("reference", reference);
            trace.removeKey("object", "args");
            back ~= Text.insert(tpl, trace, [
                    "before": "{:",
                    "after": "}"
                ]);
        }
    } */

  /* return ["array", "points"].has(options.getString(
            "format"))
        ? back : back.join("\n"); */
  /* return null;
    } */

  /**
     * Shortens file paths by replacing the application base path with "APP", and the UIM core
     * path with "CORE".
     */
  /* static string trimPath(
        string pathToShorten) {
        if (defined("APP") && indexOf(path, APP) == 0) {
            return replace(APP, "APP/", path);
        }
        if (defined("UIM_CORE_INCLUDE_PATH") && indexOf(path, UIM_CORE_INCLUDE_PATH) == 0) {
            return replace(uim_CORE_INCLUDE_PATH, "CORE", path);
        }
        if (defined("ROOT") && indexOf(path, ROOT) == 0) {
            return replace(ROOT, "ROOT", path);
        }

        return path;
    } */

  /**
     * Grabs an excerpt from a file and highlights a given line of code.
     *
     * Usage:
     *
     * ```
     * Debugger.excerpt("/path/to/file", 100, 4);
     * ```
     *
     * The above would return an array of 8 items. The 4th item would be the provided line,
     * and would be wrapped in `<span class="code-highlight"></span>`. All the lines
     * are processed with highlight_string() as well, so they have basic UIM syntax highlighting
     * applied.
     */
  /* static string[] excerpt(string absPathToFile, int lineNumber, int numberLinesContext = 2) {
        auto lines = null;
        if (
            !filehasKey(
                absPathToFile)) {
            return [
            ];
        }
        auto data = file_get_contents(
            absPathToFile);
        if (data.isEmpty) {
            return lines;
        }

        if (indexOf(data, "\n") == true) {
            data = explode("\n", data);
        }

        lineNumber--;
        if (
            data.isNull(
                lineNumber)) {
            return lines;
        }
        for (
            i = lineNumber - numberLinesContext; i < lineNumber + numberLinesContext + 1;
            i++) {
            if (data.isNull(i)) {
                continue;
            }
            string text = replace([
                    "\r\n",
                    "\n"
                ], "", _highlight(
                    data[i]));
            lines ~= i == lineNumber
                ? htmlDoubletag("span", [
                        "code-highlight"
                    ], text) : text;
        }

        return lines;
    } */

  /**
     * Wraps the highlight_string function in case the server API does not
     * implement the function as it is the case of the HipHop interpreter
     */
  /*     protected static string _highlight(
        string stringToConvert) {
        if (function_hasKey("hD_log") || function_hasKey(
                "hD_gettid")) {
            return htmlentities(
                stringToConvert);
        }

        auto added = false;
        if (indexOf(stringToConvert, "<?D") == false) {
            added = true;
            stringToConvert = "<?D \n" ~ stringToConvert;
        }
        auto highlight = highlight_string(
            stringToConvert, true);
        if (added) {
            highlight = replace(
                [
                    "&lt;?D&nbsp;<br/>",
                    "&lt;?D&nbsp;<br />"
                ],
                "",
                highlight
            );
        }

        return highlight;
    }
 */
  /**
     * Get the configured export formatter or infer one based on the environment.
     *
     * @return uim.errors.debugs.IErrorFormatter
     * @unstable This method is not stable and may change in the future.
     */
  // IErrorFormatter getExportFormatter() {
  /*         auto instance = getInstance();
        string formaterClassname = instance
            .getConfig(
                "exportFormatter");
        if (!formaterClassname) {
            if (DConsoleFormatter.environmentMatches()) {
                formaterClassname = ConsoleFormatter
                    .classname;
            } else if (
                HtmlFormatter.environmentMatches()) {
                formaterClassname = HtmlFormatter
                    .classname;
            } else {
                formaterClassname = TextFormatter
                    .classname;
            }
        }

        auto instance = new aclassname();
        if (
            !cast(
                IErrorFormatter) instance) {
            throw new DRuntimeException(
                "The `{aclassname}` formatter does not implement " ~ IErrorFormatter
                    .classname
            );
        }
        return instance;
 */
  /*     return null;
    } */

  // Converts a variable to a plain text string.
  /* static string exportVarAsPlainText(Json value, int maxOutputDepth = 3) {
        return (new DTextFormatter()).dump(
            export_(
                value, new DDebugContext(
                maxOutputDepth))
        );
    } */

  /**
     * Convert the variable to the internal node tree.
     *
     * The node tree can be manipulated and serialized more easily
     * than many object graphs can.
     */
  /* static IErrorNode exportVarAsNodes(
        Json varToConvert, int maxOutputDepth = 3) {
        return export_(varToConvert, new DDebugContext(
                maxOutputDepth));
    } */

  /**
     * Converts a variable to a string for debug output.
     *
     * *Note:* The following keys will have their contents
     * replaced with `*****`:
     *
     * - password
     * - login
     * - host
     * - database
     * - port
     * - prefix
     * - schema
     *
     * This is done to protect database credentials, which could be accidentally
     * shown in an error message if UIM is deployed in development mode.
     */
  /* static string exportVar(Json value, int maxOutputDepth = 3) {
        auto dumpContext = new DDebugContext(
            maxOutputDepth);
        return getInstance().getExportFormatter()
            .dump(
                export_(value, dumpContext));
    } */

  // Protected export function used to keep track of indentation and recursion.
  /*     protected static IErrorNode export_(Json varToDump, DDebugContext dumpContext) {
        auto type = varToDump.getString("type");
        switch (type) {
        case "float":
        case "string":
        case "resource":
        case "resource (closed)":
        case "null":
            return new DScalarErrorNode(type, varToDump);
        case "boolean":
            return new DScalarErrorNode("bool", varToDump);
        case "integer":
            return new DScalarErrorNode("int", varToDump);
        case "array":
            return exportArray(varToDump, dumpContext
                    .withAddedDepth());
        case "unknown":
            return new DSpecialErrorNode(
                "(unknown)");
        default:
            return exportObject(varToDump, dumpContext
                    .withAddedDepth());
        }
    }
 */
  /**
     * Export an array type object. Filters out keys used in datasource configuration.
     *
     * The following keys are replaced with ***"s
     *
     * - password
     * - login
     * - host
     * - database
     * - port
     * - prefix
     * - schema
     */
  // protected static DArrayErrorNode exportArray(Json[string] valueToExport, DDebugContext dumpContext) {
  /*
    auto items = null;

    autp remaining = dumpContext
        .remainingDepth();
    if (remaining >= 0) {
        outputMask = outputMask();
        foreach (valueToExport as key : val) {
            if (hasKey(key, outputMask)) {
                node = new DScalarErrorNode(
                    "string", outputMask[key]);
            } else if (
                val != valueToExport) {
                // Dump all the items without increasing depth.
                node = export_(val, dumpContext);
            } else {
                // Likely recursion, so we increase depth.
                node = export_(val, dumpContext
                        .withAddedDepth());
            }
            items ~= new DArrayItemErrorNode(
                export_(key, dumpContext), node);
        }
    } else {
        items ~= new DArrayItemErrorNode(
            new DScalarErrorNode(
                "string", ""),
            new DSpecialErrorNode(
                "[maximum depth reached]")
        );
    } 

    return new DArrayErrorNode(
        items); * /
        return null;
    } */

  // Handles object to node conversion.
  /* protected static IErrorNode exportObject(Object objToConvert, DDebugContext dumpContext) {
    /* auto isRef = dumpContext.hasReference(
        objToConvert);
    auto refNum = dumpContext
        .getReferenceId(
            objToConvert);

    auto classnameName = get_class(
        objToConvert); */
    /*     if (isRef) {
        return new DReferenceErrorNode(null, refNum);
    }
 */
    /* auto node = new DClassErrorNode(null, refNum);
    auto remaining = dumpContext
        .remainingDepth();
    if (remaining > 0) {
        if (hasMethod(objToConvert, "debugInfo")) {
            try {
                foreach (key, val;  /* (array) * / objToConvert
                    .debugInfo(string[] showKeys = null, string[] hideKeys = null)) {
                    node.addProperty(
                        new DPropertyErrorNode(
                            "" {
                            key
                        }
                    "", null, export_(val, dumpContext)));
                }

                return node;
            } catch (
                Exception e) {
                return new DSpecialErrorNode("(unable to export object: {e.message()})");
            }
        }

        auto outputMask = outputMask();
        auto objectVars = get_object_vars(
            objToConvert);
        foreach (key, value; objectVars) {
            if (hasKey(key, outputMask)) {
                value = outputMask[key];
            }
            /** @psalm-suppress RedundantCast * /
            node.addProperty(
                new DPropertyErrorNode(key, "public", export_(
                    value, dumpContext
                    .withAddedDepth()))
            );
        }

        auto reflectionObject = new DReflectionObject(
            objToConvert);

        auto filters = [
            ReflectionProperty
            .IS_PROTECTED: "protected",
            ReflectionProperty
            .IS_PRIVATE: "private",
        ];
        foreach (filter, visibility; filters) {
            reflectionProperties = reflectionObject
                .getProperties(
                    filter);
            foreach (
                reflectionProperty; reflectionProperties) {
                reflectionProperty
                    .setAccessible(
                        true);

                auuto value = hasMethod(
                    reflectionProperty, "isInitialized") && !reflectionProperty
                    .isInitialized(
                        objToConvert)
                    ? new DSpecialErrorNode("[uninitialized]") : export_(
                        reflectionProperty
                            .value(objToConvert), dumpContext
                            .withAddedDepth());

                node.addProperty(
                    new DPropertyErrorNode(
                        reflectionProperty
                        .getName(),
                        visibility,
                        value
                )
                );
            }
        }
    }

    return node; * /
    return null;
  } */

  // Get the type of the given variable. Will return the class name for objects.
  /*     static string getType(
        Json value) {
        auto type = getTypeName(
            value);

        if (type == "NULL") {
            return "null";
        }

        if (type == "double") {
            return "float";
        }

        if (
            type == "unknown type") {
            return "unknown";
        }

        return type;
    }
 */
  // Prints out debug information about given variable.
  static void printVar(Json varToShow, Json[string] location = null, bool showHtml = false) {
    /* location.mergeKeys([
        "file",
        "line"
      ]);
    if (
      location.hasKey(
        "file")) {
      location.set("file", trimPath(
          location.getString(
          "file")));
    }

    auto debugger = getInstance();
    auto restore = null;
    if (showHtml != null) {
      restore = debugger.getConfig(
        "exportFormatter");
      debugger.configuration.set(
        "exportFormatter", showHtml ? HtmlFormatter.classname : TextFormatter
          .classname);
    }
    auto contents = exportVar(varToShow, 25);
    auto formatter = debugger
      .getExportFormatter();

    if (restore) {
      debugger.setConfig(
        "exportFormatter", restore);
    }
    writeln(formatter.formatWrapper(contents, location)); */
  }

  /**
     * Format an exception message to be HTML formatted.
     *
     * Does the following formatting operations:
     *
     * - HTML escape the message.
     * - Convert `bool` into `<code>bool</code>`
     * - Convert newlines into `<br />`
     */
  /* static string formatHtmlMessage(
        string messageToFormat) {
        messageToFormat = htmlAttributeEscape(
            messageToFormat);
        messageToFormat = preg_replace(
            "/`([^`]+)`/", "<code>1</code>", messageToFormat);

        return nl2br(
            messageToFormat);
    } */

  // Verifies that the application"s salt and cipher seed value has been changed from the default value.
  // static void checkSecurityKeys() {
  // salt = Security.getSalt();
  /* if (salt == "__SALT__" || strlen(
            salt) < 32) {
        trigger_error(
            "Please change the value of `Security.salt` in `ROOT/config/app_local.D` "
                ~"to a random value of at least 32 characters.",
                ERRORS.USER_NOTICE
        );
    } */
  // }
}
