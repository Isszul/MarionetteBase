define ["jquery"
		"underscore"          
		"backbone.marionette"
		"text!templates/login/loginTemplate.html" 
		"translationUtil"
		"bootstrap"        
], ($, _, Marionette, LoginTemplate, TranslationUtil) ->

	# Class def for the login view.
	LoginView = Marionette.ItemView.extend
	
		#template is shown on the region when a .show is passed this view
		template: TranslationUtil.geti18nTemplate LoginTemplate
		
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

			$("#loginButton").unbind('click').click (e) ->
				e.preventDefault()
				Backbone.Events.trigger "loginView:login"
													
			#By Default focus on the username input
			$('#username').focus()
				
			
					
  
	#Return the class definition
	LoginView
