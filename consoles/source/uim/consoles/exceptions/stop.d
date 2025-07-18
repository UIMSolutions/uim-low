/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.consoles.exceptions.stop;

mixin(Version!"test_uim_consoles");

import uim.consoles;
@safe:



// Exception class for halting errors in console tasks
class DStopException : DConsoleException {
  // mixin(ExceptionThis!("Stop"));
}

// mixin(ExceptionCalls!("Stop"));

// unittest {
  // testException(StopException);
// }
