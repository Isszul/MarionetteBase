
define(["jquery", "underscore", "backbone.marionette", "translationUtil", "threejs"], function($, _, Marionette, TranslationUtil, ThreeJS) {
  var ThreeJsModel;
  ThreeJsModel = Backbone.Model.extend({
    initialize: function(modelFileUrl, scene) {
      this.scene = scene;
      this.modelFileUrl = modelFileUrl;
      this.loaded = false;
      this.loader = new THREE.JSONLoader();
      return this.loader.load(this.modelFileUrl, _.bind(function(geometry, materials) {
        this.geometry = geometry;
        this.materials = materials;
        this.model = new THREE.Mesh(this.geometry, this.materials[0]);
        this.model.position.x = this.model.position.y = this.model.position.z = 0;
        this.model.scale.x = this.model.scale.y = this.model.scale.z = 0.1;
        this.scene.add(this.model);
        return this.loaded = true;
      }, this));
    }
  });
  return ThreeJsModel;
});
