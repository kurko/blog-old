App.OssController = Ember.ObjectController.extend({
  image_path: function() {
    return window.images['amsterdam-smalltalk'];
  }.property()
});
