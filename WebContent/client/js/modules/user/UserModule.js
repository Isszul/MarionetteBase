
define(["views/login/LoginView", "models/user/UserModel"], function(LoginView, UserModel) {
  return function(UserModule, MyApp, Backbone, Marionette, $, _) {
    MyApp.Views.loginView = new LoginView();
    UserModule.handleSuccessfulUserLogin = function(userModel) {
      MyApp.Views.loginView.hide();
      MyApp.Models.userModel = userModel;
      MyApp.app_router.showDesktop();
      return MyApp.app_router.navigate('#desktop', true);
    };
    UserModule.handleUserLogout = function() {
      return delete MyApp.Models.userModel;
    };
    UserModule.showFailedLoginMessage = function() {
      return MyApp.Views.loginView.showFailedLoginMessage();
    };
    UserModule.attemptLogin = function() {
      return new UserModel({
        username: $("#username").val(),
        password: $("#password").val()
      }).attemptLogin();
    };
    UserModule.checkLoggedIn = function() {
      if (!(MyApp.Models.userModel != null)) {
        return MyApp.mainRegion.show(MyApp.Views.loginView);
      }
    };
    UserModule.logoutUser = function() {
      return Backbone.Events.trigger("userModel:logout");
    };
    return UserModule.addInitializer(function() {
      Backbone.Events.on("userModel:logout", this.handleUserLogout, this);
      Backbone.Events.on("userModel:loginsuccess", this.handleSuccessfulUserLogin, this);
      Backbone.Events.on("userModel:loginfailure", this.showFailedLoginMessage, this);
      Backbone.Events.on("loginView:login", this.attemptLogin, this);
      MyApp.app_router.bind('all', this.checkLoggedIn, this);
      return MyApp.app_router.route('logout', 'logout', this.logoutUser);
    });
  };
});
