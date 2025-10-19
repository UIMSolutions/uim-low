module uim.logging.classes.loggers.tests.mixins;

bool isLogger(Object obj) {
  if (obj is null) {
    return false;
  }
  return cast(ILogger)obj;
}