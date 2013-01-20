
define(["backbone", "backbone.marionette"], function(Backbone, Marionette) {
  "use strict";

  var AppRouter;
  AppRouter = Marionette.AppRouter.extend({
    routes: {
      "desktop": "showDesktop",
      "threeJS": "showThreeJSDemo",
      "tree": "showTree",
      "": "showDesktop"
    },
    initialize: function(app) {
      this.app = app;
      this.app.navBar.show(this.app.Views.navBarView);
      return this;
    },
    showTree: function() {
      return this.app.mainRegion.show(this.app.Views.treeView);
    },
    showDesktop: function() {
      return this.app.mainRegion.show(this.app.Views.desktopView);
    },
    showThreeJSDemo: function() {
      return this.app.mainRegion.show(this.app.Views.threeJSDemo);
    }
  });
  return AppRouter;
});
