/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.commands.factories.command;

mixin(Version!"test_uim_commands");

import uim.commands;
@safe:

class DCommandFactory : DFactory!DCommand {
}
auto CommandFactory() { return DCommandFactory.factory; }

// This is a factory for creating Command instances.
/* class DCommandFactory { // }: ICommandFactory {
  mixin TConfigurable;

  this() {
    initialize;
  }

  this(Json[string] initData) {
    initialize(initData);
  }

  bool initialize(Json[string] initData = null) {
    configuration(MemoryConfiguration);
    configuration.setEntries(initData);

    return true;
  }

  mixin(TProperty!("string", "name"));

  protected IContainer _container = null;
  this(IContainer newContainer = null) {
    _container = newContainer;
  }

  /* 
  ICommand create(string classname) {
    return _container && _container.has(aclassname)
      ? _container.get(aclassname).clone : null;
  } 
  * /
} */
