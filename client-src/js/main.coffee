
DEBUG_MODE = true



# Start up our application
require ["app", 
		 "backbone"
], (App, Backbone) ->

	"use strict"
	App.loadModules()
	App.start()
	Backbone.history.start()
