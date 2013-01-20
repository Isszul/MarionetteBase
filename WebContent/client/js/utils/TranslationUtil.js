
define(["backbone", "i18n!nls/general", "handlebars"], function(Backbone, nls, Handlebars) {
  var TranslationUtil;
  TranslationUtil = function() {
    return {
      geti18nString: function(value) {
        var retVal;
        if (nls[value] != null) {
          retVal = nls[value];
        } else {
          retVal = value;
        }
        return retVal;
      },
      geti18nTemplate: function(template, options) {
        var _template;
        _template = Handlebars.compile(template)({
          nls: nls,
          options: options
        });
        return _template;
      }
    };
  };
  return new TranslationUtil();
});
