/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.i18n.classes.time;

import uim.i18n;

@safe:

// Time class - Adds handy methods and locale-aware formatting helpers.
class DTime : UIMObject  { // : ChronosTime, JsonSerializable {
    // TODO mixin TDateFormat;

    // #region StringFormat
    // Sets the default format used when type converting instances of this type to string
    static void setToStringFormat(string /* int */ format) {
        /* _toStringFormat = format; */
    }

    // Resets the format used to the default when converting an instance of this type to a string
    static void resetToStringFormat() {
        // setToStringFormat(IntlDateFormatterss.SHORT);
    }
    // #endregion StringFormat

    /**
     * The format to use when formatting a time using `UIM\I18n\Time.i18nFormat()` and `__toString`.
     */
    // protected static string/* int */ _toStringFormat = IntlDateFormatterss.SHORT;

    /**
     * The format to use when converting this object to Json.
     *
     * The format should be either the formatting constants from IntlDateFormatter as
     * described in (https://secure.d.net/manual/en/class.intldateformatter.d) or a pattern
     * as specified in (https://unicode-org.github.io/icu-docs/apidoc/released/icu4c/classSimpleDateFormat.html#details)
     */
    protected static   string /* int */ _jsonEncodeFormat = "HH':'mm':'ss";

    /**
     * The format to use when formatting a time using `UIM\I18n\Time.nice()`
     *
     * The format should be either the formatting constants from IntlDateFormatter as
     * described in (https://secure.d.net/manual/en/class.intldateformatter.d) or a pattern
     * as specified in (https://unicode-org.github.io/icu-docs/apidoc/released/icu4c/classSimpleDateFormat.html#details)
     *
     * @var string|int
     */
    static string /* int */ niceFormat; // = IntlDateFormatters.MEDIUM;

    /**
     * Sets the default format used when converting this object to Json
     *
     * The format should be either the formatting constants from IntlDateFormatter as
     * described in (https://secure.d.net/manual/en/class.intldateformatter.d) or a pattern
     * as specified in (http://www.icu-project.org/apiref/icu4c/classSimpleDateFormat.html#details)
     *
     * Alternatively, the format can provide a callback. In this case, the callback
     * can receive this object and return a formatted string.
     */
    static void jsonEncodeFormat(  string /* int */ format) {
        _jsonEncodeFormat = format;
    }

    /**
     * Returns a new DTime object after parsing the provided time string based on
     * the passed or configured date time format. This method is locale dependent,
     * Any string that is passed to this auto will be interpreted as a locale
     * dependent string.
     *
     * When no format is provided, the IntlDateFormatters.SHORT format will be used.
     *
     * If it was impossible to parse the provided time, null will be returned.
     *
     * Example:
     *
     * ```
     * time = Time.parseTime("11:23pm");
     * ```
     */
    static DTime parseTime(string timeToParse, string /* int */ format = null) {
        /* auto format = format.ifEmpty([IntlDateFormatters.NONE, IntlDateFormatters.SHORT]);
        if (isInteger(format)) {
            format = [IntlDateFormatters.NONE, format];
        }
        return _parseDateTime(timeToParse, format); */
        return null;
    }

    /**
     * Returns a formatted string for this time object using the preferred format and
     * language for the specified locale.
     *
     * It is possible to specify the desired format for the string to be displayed.
     * You can either pass `IntlDateFormatter` constants as the first argument of this
     * function, or pass a full ICU date formatting string as specified in the following
     * resource: https://unicode-org.github.io/icu/userguide/format_parse/datetime/#datetime-format-syntax.
     *
     * ### Examples
     *
     * ```
     * time = new DTime("23:10:10");
     * time.i18nFormat();
     * time.i18nFormat(\IntlDateFormatters.FULL);
     * time.i18nFormat("HH": 'mm": `ss");
     * ```
     *
     * You can control the default format used through `Time.setToStringFormat()`.
     *
     * You can read about the available IntlDateFormatter constants at
     * https://secure.d.net/manual/en/class.intldateformatter.d
     *
     * Should you need to use a different locale for displaying this time object,
     * pass a locale string as the third parameter to this function.
     *
     * ### Examples
     *
     * ```
     * time = new DTime("2014-04-20");
     * time.i18nFormat("de-DE");
     * time.i18nFormat(\IntlDateFormatters.FULL, "de-DE");
     * ```
     *
     * You can control the default locale used through `DateTime.setDefaultLocale()`.
     * If empty, the default will be taken from the `intl.default_locale` ini config.
     */
    string /* int */ i18nFormat(
        string /* int */ format = null,
        string localName = null
    ) {
        /* if (format == DateTime.UNIX_TIMESTAMP_FORMAT) {
            throw new DInvalidArgumentException("UNIT_TIMESTAMP_FORMAT is not supported for Time.");
        }
        format ??= _toStringFormat;
        format = isInteger(format) ? [IntlDateFormatters.NONE, format] : format;
        localName = localName ?: DateTime.getDefaultLocale();

        return _formatObject(toNative(), format, localName); */
        return null;
    }

    /**
     * Returns a nicely formatted date string for this object.
     * The format to be used is stored in the static property `Time.niceFormat`.
     */
    string nice(string localeName = null) {
        return to!string(this.i18nFormat(niceFormat, localeName));
    }

    // Returns a string that should be serialized when converting this object to Json
    string JsonSerialize() {
        /* if (cast(DClosure)_jsonEncodeFormat) {
            return call_user_func(_jsonEncodeFormat, this);
        }
        return _i18nFormat(_jsonEncodeFormat); */
        return null;
    }

    override string toString() {
        // TODO return to!string(this.i18nFormat());
        return null;
    }
}
