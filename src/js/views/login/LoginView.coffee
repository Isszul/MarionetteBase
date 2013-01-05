define ["jquery"
        "underscore"          
        "backbone.marionette"
        "models/user/UserModel"
        "text!templates/login/loginTemplate.html" 
        "translationUtil"
        "bootstrap"        
], ($, _, Marionette, UserModel, LoginTemplate, TranslationUtil) ->

	# Class def for the login view.
	LoginView = Marionette.View.extend
	
		#template is shown on the region when a .show is passed this view
		template: TranslationUtil.geti18nTemplate LoginTemplate
		
		initialize:  ->
			Backbone.Events.on "userModel:loginfailure", @showFailedLoginMessage, @

		#Show a message explaining that the user has failed to log in
		showFailedLoginMessage:  -> 
			$('#loginMessage').html TranslationUtil.geti18nString "failed_login"
			
		#Close the login modal
		hide:  ->
			$("#mainLoginDiv").modal "hide"
			
		#Show a modal form to prompt for login details
		onShow:  -> 

			$("#mainLoginDiv").modal
				keyboard: false
				backdrop: 'static'


			$("#loginButton").click (e) ->
				e.preventDefault()
				#Create a user model and attempt a login
				new UserModel
				  username: $("#username").val()
				  password: $("#password").val()
				.attemptLogin()
													
			#By Default focus on the username input
			$('#username').focus()
				
			#When we push enter on the password input attempt the login	
			$('#password').keypress (e) ->
				$("#loginButton").click() if(e.which == 13)

			@					
					
  
	#Return the class definition
	LoginView
