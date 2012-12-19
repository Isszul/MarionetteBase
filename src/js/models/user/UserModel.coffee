define ["backbone"
], (Backbone) ->

  #Class def for the user model
  userModel = Backbone.Model.extend(
  	
  	#Defaults values passed on empty contruction
    defaults:
      username: "unknown"
      password: "unknown"


    #Contructor
    initialize: (options) ->
      @username = options.username
      @password = options.password

    #REST Url used when calling .save() .fetch() etc...
    url: ->
      "test/?username=" + @username + "&password=" + @password

    #Public function to attempt the login.
    attemptLogin: ->
    	
      #Call fetch internally but attach success and error handlers 
      @fetch
      
        #When there is a successful request made (still need to validate and check the response)
        success: (userModel, response, options) ->
          console.log "log in request responded"
          window.Backbone.Events.trigger "userModel:loginsuccess", userModel if response.validLogin
          window.Backbone.Events.trigger "userModel:loginfailure", userModel if !response.validLogin

		#When the ajax call fails
        error: (userModel, jqXHR, options) ->
          console.log "error in login"
          window.Backbone.Events.trigger "userModel:loginfailure", userModel

  )
  
  #Return the userModel definition
  userModel
