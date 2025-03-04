/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.i18n.classes.catalogs.catalog;

import uim.i18n;
@safe:

version (test_uim_i18n) {
  unittest {
    writeln("-----  ", __MODULE__, "\t  -----");
  }
}

// Translator to translate the message.
class DMessageCatalog : UIMObject, IMessageCatalog {
  mixin(MessageCatalogThis!());

/*   this(
    string[][string] messages,
    string formatterName = "default",
    string fallbackName = null,
  ) {
    super();
    this.messages(messages);
    this.formatterName(formatterName);
    this.fallbackName(fallbackName);
  } */

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    formatterName("default");

    return true;
  }

  // #region messages
  // Message keys and translations in this catalog.
  protected string[][string] _messages;
  string[][string] messages(string[] keys...) {
    return messages(keys.dup);
  }
  /// 
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.messages(["de": ["Willkommen"], "en": ["Welcome"]]);
    assert(catalog.messages("de").length == 1);
    assert(catalog.messages("de", "en").length == 2);
    assert(catalog.messages("de", "en", "fr").length == 2);
  }

  string[][string] messages(string[] keys) {
    string[][string] result;

    keys
      .filter!(key => _messages.hasKey(key))
      .each!(key => result[key] = _messages[key]);

    return result;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.messages(["de": ["Willkommen"], "en": ["Welcome"]]);
    assert(catalog.messages(["de"]).length == 1);
    assert(catalog.messages(["de", "en"]).length == 2);
    assert(catalog.messages(["de", "en", "fr"]).length == 2);
  }

  string[][string] messages() {
    return _messages;
  }

  string[] message(string key) {
    return _messages.get(key, null);
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    assert(catalog.messages.length == 0);

    catalog.messages(["de": ["Willkommen"]]);
    assert(catalog.messages.length == 1);
    assert(catalog.messages["de"].length == 1);

    catalog.messages(["de": ["Willkommen"], "en": ["Welcome"]]);
    assert(catalog.messages.length == 2);
    assert(catalog.messages["de"].length == 1);
  }

  IMessageCatalog messages(string[][string] newMessages) {
    _messages = newMessages;
    return this;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    assert(catalog.messages.length == 0);

    catalog.messages(["de": ["Willkommen"]]);
    assert(catalog.messages.length == 1);
    assert(catalog.messages["de"].length == 1);

    catalog.messages(["de": ["Willkommen"], "en": ["Welcome"]]);
    assert(catalog.messages.length == 2);
    assert(catalog.messages["de"].length == 1);
  }
  // #endregion messages

  // #region fallbackName
  // The name of a fallback catalog to use when a message key does not exist.
  protected string _fallbackName;
  @property string fallbackName() {
    return _fallbackName;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.fallbackName("abc");
    assert(catalog.fallbackName = "abc");
  }

  @property IMessageCatalog fallbackName(string name) {
    _fallbackName = name;
    return this;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.fallbackName("abc");
    assert(catalog.fallbackName == "abc");
  }
  // #endregion fallbackName

  // #region formatterName
  // The name of the formatter to use when formatting translated messages.
  protected string _formatterName;
  @property string formatterName() {
    return _formatterName;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.formatterName("abc");
    assert(catalog.formatterName == "abc");
  }

  @property IMessageCatalog formatterName(string name) {
    _formatterName = name;
    return this;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.formatterName("abc");
    assert(catalog.formatterName == "abc");
  }
  // #endregion formatterName

  // #region setMessage
  IMessageCatalog setMessages(string[][string] messages) {
    messages.each!((key, value) => setMessage(key, value));
    return this;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.messages([
      "de": ["Willkommen", "zu", "Deinem", "Framework"],
      "en": ["Welcome"]
    ]);
    assert(catalog.messages.length == 2);
    assert(catalog.messages["de"].length == 4);
  }

  IMessageCatalog setMessage(string key, string[] message) {
    _messages[key] = message;
    return this;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.setMessage("de", ["Willkommen", "zu", "Deinem", "Framework"]);
    assert(catalog.messages.length == 1);
    assert(catalog.messages["de"].length == 4);
  }
  // #region setMessage

  // #region updateMessages
  IMessageCatalog updateMessages(string[][string] messages) {
    messages.each!((key, value) => updateMessage(key, value));
    return this;
  }

  IMessageCatalog updateMessage(string key, string[] message) {
    if (_messages.hasKey(key))
      _messages[key] = message;
    return this;
  }
  ///
  unittest {
/*   auto catalog = new DMessageCatalog;
  catalog.messages([
    "de": ["Willkommen", "zu", "Deinem", "Framework"],
    "en": ["Welcome"]
  ]);
  catalog.updateMessages(["de": ["hi"], "fr": ["Salut"]]);
  assert(catalog.messages.length == 2);
  assert(catalog.messages["de"].length == 1);

  auto catalog = new DMessageCatalog;
  catalog.messages([
    "de": ["Willkommen", "zu", "Deinem", "Framework"],
    "en": ["Welcome"]
  ]);

  catalog.updateMessage("de", ["hi"]);
  assert(catalog.messages.length == 2);
  assert(catalog.messages["de"].length == 1);

  catalog.updateMessage("fr", ["salut"]);
  assert(catalog.messages.length == 2);
  assert(catalog.messages["de"].length == 1);
 */  }
  // #endregion updateMessages

  // #region mergeMessages
  IMessageCatalog mergeMessages(string[][string] messages) {
    messages.each!((key, value) => mergeMessage(key, value));
    return this;
  }

  IMessageCatalog mergeMessage(string key, string[] message) {
    if (!_messages.hasKey(key))
      _messages[key] = message;
    return this;
  }
  ///
  unittest {
    auto catalog = new DMessageCatalog;
    catalog.messages([
      "Cancel": ["Abbrechen"], 
      "Submit": ["Absenden"], 
      "Yes": ["Ja"], 
      "No": ["Nein"]
    ]);
    assert(catalog.messages.length == 4);

    catalog.mergeMessages([ 
      "LogIn": ["Anmelden"],
      "Register": ["Registrieren"]
    ]);
    assert(catalog.messages.length == 6);
    assert(catalog.message("Cancel") == ["Abbrechen"]);
    assert(catalog.message("LogIn") == ["Anmelden"]);
  }
  // #endregion mergeMessages
}

unittest {
  auto catalog = new DMessageCatalog;
  catalog.messages([
    "Cancel": ["Abbrechen"], 
    "Submit": ["Absenden"], 
    "Yes": ["Ja"], 
    "No": ["Nein"]
  ]);
}