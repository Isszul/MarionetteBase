define ["jquery"
    "underscore"
    "backbone.marionette"
    "text!templates/threeJSDemo/threeJSDemoTemplate.html"
    "translationUtil"
    "threejs"
    "models/threeJsModel/ThreeJsModel"
], ($, _, Marionette, ThreeJSDemoTemplate, TranslationUtil, threejs, ThreeJsModel) ->

    # Class def for the view.
    ThreeJSDemoView = Marionette.ItemView.extend

        #template is shown on the region when a .show is passed this view
        template: TranslationUtil.geti18nTemplate ThreeJSDemoTemplate

        initialize: () ->
            @WIDTH = 800
            @HEIGHT = 500
            @VIEW_ANGLE = 45
            @ASPECT = @WIDTH / @HEIGHT
            @NEAR = 0.1
            @FAR = 10000

            @renderer = new THREE.WebGLRenderer    
            @renderer.setSize @WIDTH, @HEIGHT

            @camera = new THREE.PerspectiveCamera(
                @VIEW_ANGLE,
                @ASPECT,
                @NEAR,
                @FAR 
            )

            @camera.position.z = 4

            @scene = new THREE.Scene()
            @scene.add @camera

            @camera.lookAt @scene.position 

            @cubeModel = new ThreeJsModel("./models/ciscoswitch/switch.js", @scene)

            @pointLight = new THREE.PointLight(0xFFFFFF)
            @pointLight.position.x = 1
            @pointLight.position.y = 5
            @pointLight.position.z = 3

            @scene.add @pointLight

        renderScene: () ->

            if(@cubeModel.loaded == true)

                @cubeModel.model.rotation.y += 0.01
                @cubeModel.model.rotation.z += 0.01
                @cubeModel.model.rotation.x += 0.01

                @renderer.render @scene, @camera

            requestAnimationFrame _.bind @renderScene, this

        onShow: () ->

            $('#threeJSDemo').append @renderer.domElement
            @renderScene()



    #Return the class definition
    ThreeJSDemoView
