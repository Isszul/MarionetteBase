define ["views/login/LoginView",
		"models/user/UserModel" 
], (LoginView, UserModel) ->

	(UserModule, MyApp, Backbone, Marionette, $, _) ->

		MyApp.Views.loginView = new LoginView()

		UserModule.handleSuccessfulUserLogin = (userModel) ->
			MyApp.Views.loginView.hide()
			MyApp.Models.userModel = userModel
			MyApp.app_router.showDesktop() #if we are on the desktop the navigate call does nothing below
			MyApp.app_router.navigate '#desktop', true

		UserModule.handleUserLogout = ()  ->
			delete MyApp.Models.userModel

		UserModule.showFailedLoginMessage = () ->
			MyApp.Views.loginView.showFailedLoginMessage()

		UserModule.attemptLogin = () ->
			#Create a user model and attempt a login
			new UserModel
				username: $("#username").val()
				password: $("#password").val()
			.attemptLogin()

		#check if there is a usermodel @ app.models.userModel
		UserModule.checkLoggedIn = () ->
			MyApp.mainRegion.show MyApp.Views.loginView if not MyApp.Models.userModel?			

		#Raise a user logged out event
		UserModule.logoutUser = () ->
			Backbone.Events.trigger "userModel:logout"		


		UserModule.addInitializer ->
			Backbone.Events.on "userModel:logout", @handleUserLogout, this
			Backbone.Events.on "userModel:loginsuccess", @handleSuccessfulUserLogin, this
			Backbone.Events.on "userModel:loginfailure", @showFailedLoginMessage, this
			Backbone.Events.on "loginView:login", @attemptLogin, this
			
			#Bind the login check to all the routes
			MyApp.app_router.bind 'all', @checkLoggedIn, this

			#logout route
			MyApp.app_router.route 'logout', 'logout', @logoutUser

