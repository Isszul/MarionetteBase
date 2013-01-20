var DEBUG_MODE;

DEBUG_MODE = true;

require(["app", "backbone"], function(App, Backbone) {
  "use strict";
  App.loadModules();
  App.start();
  return Backbone.history.start();
});
