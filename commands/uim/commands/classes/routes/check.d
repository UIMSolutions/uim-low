/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.commands.classes.commands.routes.check;

import uim.commands;

@safe:

// Provides interactive CLI tool for testing routes.
class DRoutesCheckCommand : DCommand {
  mixin(CommandThis!("RoutesCheck"));

  static string defaultName() {
    return "routes-check";
  }

  /* override bool execute(Json[string] arguments, IConsole console = null) {
    return super.execute(arguments, aConsole);
  } */

  // Display all routes in an application
  override bool execute(Json[string] arguments, IConsole console = null) {
    // auto myUrl = commandArguments.getArgument("url");
    /* try {
      auto request = new DServerRequest(["url": url]);
      auto route = Router.parseRequest(request);
      string name = null;
      foreach (route; Router.routes()) {
        if (route.match(route)) {
          name = route.options.getString("_name", route.name);
          break;
        }
      }
      
      route.removeKey("_route", "_matchedRoute");
      ksort(route);

      output = [
        ["Route name", "URI template", "Defaults"],
        [name, url, Json_encode(route, Json_THROW_ON_ERROR)],
      ];
      aConsole.helper("table").output(output);
      aConsole.out ();
    } catch (DRedirectException anException) {
      output = [
        ["URI template", "Redirect"],
        [url, anException.message()],
      ];
      aConsole.helper("table").output(output);
      aConsole.out ();
    } catch (MissingRouteException) {
      aConsole.warning("'url' did not match any routes.");
      aConsole.out ();

      return false;
    } */
    return true; 
  }

  /* 
  DConsoleOptionParser buildOptionParser(DConsoleOptionParser parserToUpdate) {
    parserToUpdate.description(
      "Check a URL string against the routes. " ~
        "Will output the routing parameters the route resolves to."
   )
      .addArgument("url", MapHelper.create!(string, Json)
          .set("help", "The URL to check.")
          .set("required", true)
        );

    return parserToUpdate;
  } */
}
