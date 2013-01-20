
define(["jquery", "underscore", "backbone.marionette", "text!templates/threeJSDemo/threeJSDemoTemplate.html", "translationUtil", "threejs", "models/threeJsModel/ThreeJsModel"], function($, _, Marionette, ThreeJSDemoTemplate, TranslationUtil, threejs, ThreeJsModel) {
  var ThreeJSDemoView;
  ThreeJSDemoView = Marionette.ItemView.extend({
    template: TranslationUtil.geti18nTemplate(ThreeJSDemoTemplate),
    initialize: function() {
      this.WIDTH = 800;
      this.HEIGHT = 500;
      this.VIEW_ANGLE = 45;
      this.ASPECT = this.WIDTH / this.HEIGHT;
      this.NEAR = 0.1;
      this.FAR = 10000;
      if (Detector.webgl) {
        this.renderer = new THREE.WebGLRenderer();
      } else {
        this.renderer = new THREE.CanvasRenderer();
      }
      this.renderer.setSize(this.WIDTH, this.HEIGHT);
      this.camera = new THREE.PerspectiveCamera(this.VIEW_ANGLE, this.ASPECT, this.NEAR, this.FAR);
      this.camera.position.z = 4;
      this.scene = new THREE.Scene();
      this.scene.add(this.camera);
      this.camera.lookAt(this.scene.position);
      this.cubeModel = new ThreeJsModel("./models/cube/cube.js", this.scene);
      this.pointLight = new THREE.PointLight(0xFFFFFF);
      this.pointLight.position.x = 1;
      this.pointLight.position.y = 5;
      this.pointLight.position.z = 3;
      return this.scene.add(this.pointLight);
    },
    renderScene: function() {
      if (this.cubeModel.loaded === true) {
        this.cubeModel.model.rotation.x += 0.01;
        this.cubeModel.model.rotation.y += 0.01;
        this.renderer.render(this.scene, this.camera);
      }
      return requestAnimationFrame(_.bind(this.renderScene, this));
    },
    onShow: function() {
      $('#threeJSDemo').append(this.renderer.domElement);
      return this.renderScene();
    }
  });
  return ThreeJSDemoView;
});
