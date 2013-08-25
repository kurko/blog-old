App.AboutController = Ember.ObjectController.extend({
  image_path: function() {
    return window.images['tokyo-woman'];
  }.property()
});
