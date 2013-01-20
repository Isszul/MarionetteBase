# Filename: router.js
define ["backbone"
		"backbone.marionette"
], (Backbone, Marionette) ->
	"use strict"

	# Class definition for the AppRouter
	AppRouter = Marionette.AppRouter.extend
			
		#configures routes, these link the "/#" urls to functions.
		routes:
			
			#route when navigating to #/desktop 
			"desktop": "showDesktop"

			#placeholder
			"threeJS": "showThreeJSDemo"

			#Tree
			"tree": "showTree"
			
			#Default route
			"": "showDesktop"

		# Constructor for this router
		# 	@param app A reference to the main application
		#
		initialize: (app) ->
			@app = app			
			@app.navBar.show @app.Views.navBarView
			@

		#Shows the tree in the main region
		showTree: () ->
			@app.mainRegion.show @app.Views.treeView

		#Shows the desktop in the main Region
		showDesktop:  () ->
			@app.mainRegion.show @app.Views.desktopView

		#Show the threeJSDemo
		showThreeJSDemo:  () ->
			@app.mainRegion.show @app.Views.threeJSDemo

	



			
			
	
	AppRouter
