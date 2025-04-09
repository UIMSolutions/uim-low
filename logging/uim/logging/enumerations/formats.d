module uim.logging.enumerations.formats;

mixin(Version!"test_uim_logging");

import uim.logging;
@safe:

enum FileLoggerFormats : string {
    NONE	= "none", 
    PLAIN	= "plain", // Output only the plain log message
    THREAD	= "thread", // Prefix "[thread-id:fiber-id loglevel]"
    THREADTIME	= "threadTime" // Prefix "[thread-id:fiber-id timestamp loglevel]"
}


// #region convert
auto fileLoggerFormats() {
    return [EnumMembers!FileLoggerFormats];
}

auto toStrings(FileLoggerFormats[] features) {
    return features.map!(f => cast(string)f).array;
}

auto fileLoggerFormats(string name) {
    foreach(feature; fileLoggerFormats) {
        if (cast(string)feature == name) return feature;
    }
    return FileLoggerFormats.NONE;
}
unittest {
    assert(fileLoggerFormats("plain") == FileLoggerFormats.PLAIN);
}
// #endregion convert
