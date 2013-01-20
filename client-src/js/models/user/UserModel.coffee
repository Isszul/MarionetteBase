define ["backbone"
], (Backbone) ->

	#Class def for the user model
	userModel = Backbone.Model.extend
		
		#Defaults values passed on empty contruction
		defaults:
			username: "unknown"
			password: "unknown"


		#Contructor
		initialize: (options) ->
			@username = options.username
			@password = options.password
			@

		#REST Url used when calling .save() .fetch() etc...
		url: -> 
            "user?username=#{@username}&password=#{@password}" 

		#Public function to attempt the login.
		attemptLogin: ->

			if @username == "administrator" and DEBUG_MODE
				Backbone.Events.trigger "userModel:loginsuccess", this
				return


			#Call fetch internally but attach success and error handlers 
			@fetch

		        #When the ajax call fails
				error: (userModel, jqXHR, options) ->
					Backbone.Events.trigger "userModel:loginfailure", userModel
			
				#When there is a successful request made (still need to validate and check the response)
				success: (userModel, response, options) ->
					Backbone.Events.trigger "userModel:loginsuccess", userModel if response.validLogin
					Backbone.Events.trigger "userModel:loginfailure", userModel if !response.validLogin



	
	
	#Return the userModel definition
	userModel
