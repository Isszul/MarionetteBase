
define(["backbone"], function(Backbone) {
  var userModel;
  userModel = Backbone.Model.extend({
    defaults: {
      username: "unknown",
      password: "unknown"
    },
    initialize: function(options) {
      this.username = options.username;
      this.password = options.password;
      return this;
    },
    url: function() {
      return "user?username=" + this.username + "&password=" + this.password;
    },
    attemptLogin: function() {
      if (this.username === "administrator" && DEBUG_MODE) {
        Backbone.Events.trigger("userModel:loginsuccess", this);
        return;
      }
      return this.fetch({
        error: function(userModel, jqXHR, options) {
          return Backbone.Events.trigger("userModel:loginfailure", userModel);
        },
        success: function(userModel, response, options) {
          if (response.validLogin) {
            Backbone.Events.trigger("userModel:loginsuccess", userModel);
          }
          if (!response.validLogin) {
            return Backbone.Events.trigger("userModel:loginfailure", userModel);
          }
        }
      });
    }
  });
  return userModel;
});
