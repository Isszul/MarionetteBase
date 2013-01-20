define ["backbone"
				"i18n!nls/general"
				"handlebars"
], (Backbone, nls, Handlebars) ->

	#Class def for the model
	TranslationUtil = () ->

		#translates a single string
		geti18nString: (value) ->
			if nls[value]? then retVal = nls[value] else retVal = value
			retVal



		#Translation a whole page with additional options 
		geti18nTemplate: (template, options) ->
			_template = Handlebars.compile(template)({ nls: nls, options: options })
			_template

	
	new TranslationUtil()
