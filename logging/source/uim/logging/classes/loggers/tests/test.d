module uim.logging.classes.loggers.tests.test;

import uim.logging;
mixin(Version!"test_uim_logging");

@safe:

bool testLogger(ILogger logger, string loggerType) {
  assert(logger !is null, "Logger is null");
  assert(logger.type == loggerType, "Logger type mismatch");
  return true;
}