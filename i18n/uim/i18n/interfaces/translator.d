module uim.i18n.interfaces.translator;

import uim.i18n;

@safe:

// Translator to translate the message.
interface ITranslator {
  // Translates the message formatting any placeholders
  // TODO string translate(string key, string[string] options);

  // Get/Set fallback translator
  ITranslator fallbackTranslator();
  ITranslator fallbackTranslator(ITranslator newFallback);

  // Get/Set locale
  string locale();
  ITranslator locale(string newLocale);

  // Get/Set translator catalog
  IMessageCatalog catalog();
  ITranslator catalog(IMessageCatalog newCatalog);

  string[] message(string key, string[] defaultMessage = null);
}
