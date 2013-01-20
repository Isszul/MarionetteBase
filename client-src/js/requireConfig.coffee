#Require config
require.config

	#Base config for require
	config:
		i18n:
			locale: "root"
	
	baseUrl : 'js'
			
	#Import name to path relationships
	paths:
		app: "app"
		router: "router"
		templates: "../templates"
		jquery: "../libs/jquery/jquery-min"
		jqueryhotkeys: "../libs/jquery/jquery.hotkeys"
		jstree: "../libs/jquery/jquery.jstree"
		bootstrap: "../libs/bootstrap/bootstrap"
		underscore: "../libs/underscore/underscore1.4.3-min"
		text: "../libs/text/text"
		json2: "../libs/json2/json2"
		backbone: "../libs/backbone/backbone-min"
		"backbone.wreqr": "../libs/backbone/backbone.wreqr.min"
		"backbone.babysitter": "../libs/backbone/backbone.babysitter.min"
		"backbone.eventbinder": "../libs/backbone/backbone.eventbinder.min"
		"backbone.marionette": "../libs/backbone/backbone.marionette.min"
		"handlebars": "../libs/handlebars/handlebars-1.0.rc.1"
		"translationUtil": "utils/translationUtil"
		"i18n": "../libs/require/i18n"
		"threejs" : "../libs/threejs/three.min"


	#Maps the interdependancies
	shim:
		underscore:
			exports: "_"

		jquery:
			exports: "$"

		jqueryhotkeys:
			deps: ["jquery"]

		jstree:
			deps: ["jquery"]
			
		bootstrap:
			deps: ["jquery"]
					
		"handlebars": 
			exports: "Handlebars"
			
		"translationUtil":
			deps: ["handlebars", "backbone"]
			exports: "translationUtil"

		backbone:
			deps: ["underscore", "jquery"]
			exports: "Backbone"

		"backbone.wreqr":
			deps: ["backbone"]
			exports: "Wreqr"

		"backbone.babysitter":
			deps: ["backbone"]
			exports: "Babysitter"

		"backbone.eventbinder":
			deps: ["backbone"]
			exports: "Eventbinder"

		"backbone.marionette":
			deps: ["backbone", "backbone.eventbinder", "backbone.babysitter", "backbone.wreqr"]
			exports: "Marionette"
			
		"app":
			deps: ["backbone.marionette"]
			exports: "App"
			
		"router":
			deps: ["backbone.marionette"]
			exports: "router"    
			