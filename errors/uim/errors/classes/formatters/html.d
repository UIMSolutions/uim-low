/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.errors.classes.formatters.html;

import uim.errors;
@safe:

version (test_uim_errors) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

/**
 * A Debugger formatter for generating interactive styled HTML output.
 *
 * @internal
 */
class DHtmlErrorFormatter : DErrorFormatter {
  mixin(ErrorFormatterThis!("Html"));

  protected static bool outputHeader = false;

  // Random id so that HTML ids are not shared between dump outputs.
  protected string _id;

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    _id = randomUUID.toString;
    return true;
  }

  // Check if the current environment is not a CLI context
  static bool environmentMatches() {
/*     return UIM_SAPI == "cli" || UIM_SAPI == "Ddbg"
      ? false : true; */
      return false;
  }

  string formatWrapper(string acontents, Json[string] location) {
    string lineInfo = "";
    if (location.hasAllKeys("file", "line")) {
      /* lineInfo = htmlDoubleTag("span", "<strong>{file}</strong> (line <strong>{line}</strong>)")
        .mustache(location, ["file", "line"]); */
    }

/*     return [
      `<div class="uim-debug-output uim-debug" style="direction:ltr">`,
      lineInfo,
      contents,
      "</div>",
    ].join("\n"); */
    return null;
  }

  /**
     * Generate the CSS and Javascript for dumps
     * Only output once per process as we don`t need it more than once.
     */
  protected string dumpHeader() {
    /* ob_start();
        include __DIR__~ DIR_SEPARATOR ~ "dumpHeader.html";

        return to!string(ob_get_clean()); */
    return null;
  }

  // Convert a tree of IErrorNode objects into HTML
  override string dump(IErrorNode node) {
    auto content = export_(node, 0);
    string head = "";
    if (!outputHeader) {
      outputHeader = true;
      head = this.dumpHeader();
    }
    return head ~ htmlDoubleTag("div", ["uim-debug"], content);
  }

  // #region export
  protected override string exportArray(DArrayErrorNode tvar, size_t indentLevel) {
    /* auto open = "<span class="uim-debug-array">" ~
           style("punct", "[") ~
            "<samp class="uim-debug-array-items">";
        auto vars = null;
        auto breakTxt = "\n" ~" ".repeatTxt( indentLevel);
        auto endBreak = "\n" ~" ".repeatTxt( indentLevel - 1);

        auto arrow = style("punct", ": ");
        nodeToExport.getChildren().each!((item) {
            val = anItem.value();
            vars ~= breakTxt ~ htmlDoubleTag("span", ["uim-debug-array-item"], 
                export_(item.getKey(),  indentLevel) ~ arrow ~ export_(val,  indentLevel) ~
                style("punct", ","));
        });

        auto close = "</samp>" ~
            endBreak ~
           style("punct", "]") ~
            "</span>";

        return open ~ vars.join("") ~ close; */
    return null;
  }

  protected override string exportReference(DReferenceErrorNode node, size_t indentLevel) {
    auto objectId = "uim-db-object-{this.id}-{node.id()}";
    auto result = "<span class=\"uim-debug-object\" id=\"%s\">".format(objectId);
    auto breakTxt = "\n" ~" ".repeatTxt(indentLevel);
    auto endBreak = "\n" ~" ".repeatTxt(indentLevel - 1);

    auto link = `<a class="uim-debug-ref" href="#%s">id: %s</a>`
      .format(objectId, node.id());

/*     return htmlDoubleTag("span", ["uim-debug-ref"],
      style("punct", "object(") ~
        style("class", node.value()) ~
        style("punct", ") ") ~
        link ~
        style("punct", " {}")); */

    return null;
  }

  protected override string exportClass(DClassErrorNode aNode, size_t indentLevel) {
    /* auto objectId = "uim-db-object-{this.id}-{node.id()}";
        auto result = "<span class=\"uim-debug-object\" id=\"%s\">".format(objectId);
        auto breakTxt = "\n" ~" ".repeatTxt( indentLevel);
        auto endBreak = "\n" ~" ".repeatTxt( indentLevel - 1);

        
         result ~= style("punct", "object(") ~
           style("class", node.value()) ~
           style("punct", ") id:") ~
           style("number", (string)node.id()) ~
           style("punct", " {") ~
            "<samp class=\"uim-debug-object-props\">";

        string[] props = null;
        foreach (aProperty; node.getChildren()) {
            auto arrow = style("punct", ": ");
            auto visibility = aProperty.getVisibility();
            auto name = aProperty.name;
            props ~= visibility && visibility != "public"
                ? breakTxt ~
                    htmlDoubleTag("span", ["uim-debug-prop"], 
                    style("visibility", visibility) ~ ' ' ~ style("property", name) ~ arrow ~ export_(aProperty.value(),  indentLevel))
                : breakTxt ~
                    htmlDoubleTag("span", ["uim-debug-prop"], 
                    style("property", name) ~ arrow ~ export_(aProperty.value(),  indentLevel));
        }
        end = "</samp>" ~
            endBreak ~
            style("punct", "}") ~
            "</span>";

        return count(props)
            ? result ~ props.join("") ~ end
            : result ~ end; */
    return null;
  }

  protected override string exportProperty(DPropertyErrorNode node, size_t indentLevel) {
    return null;
  }

  protected override string exportScalar(DScalarErrorNode node, size_t indentLevel) {
    /* switch (node.getType()) {
    case "bool":
      return style("const", node.getBoolean() ? "true" : "false");
    case "null":
      return style("const", "null");
    case "string":
      return style("string", "'" ~ node.getString() ~ "'");
    case "int", "float":
      return style("visibility", "({node.getType()})") ~
        " " ~ style("number", "{node.value()}");
    default:
      return "({node.getType()}) {node.value()}";
    }; */

    return null;
  }

  protected override string exportSpecial(DSpecialErrorNode node, size_t indentLevel) {
    return null;
  }
  // #endregion export

  // Style text with HTML class names
  protected string style(string styleToUse, string testToStyle) {
    return htmlDoubleTag("span", ["uim-debug-%s"], "%s")
      .format(styleToUse, htmlAttributeEscape(testToStyle));
  }
}
