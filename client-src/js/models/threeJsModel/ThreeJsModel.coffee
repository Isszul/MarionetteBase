define ["jquery"
    "underscore"
    "backbone.marionette"
    "translationUtil"
    "threejs"
], ($, _, Marionette, TranslationUtil, ThreeJS) ->

    ThreeJsModel = Backbone.Model.extend

        initialize: (modelFileUrl, scene) ->

            @scene = scene

            @modelFileUrl = modelFileUrl

            @loaded = false

            @loader = new THREE.JSONLoader()

            @loader.load @modelFileUrl, _.bind (geometry, materials) ->

                @geometry = geometry
                @materials = materials

                @model = new THREE.Mesh(@geometry, @materials[0])

                @model.position.x = @model.position.y = @model.position.z = 0
                @model.scale.x = @model.scale.y = @model.scale.z = 0.1

                @scene.add @model

                @loaded = true                

            , this






    ThreeJsModel