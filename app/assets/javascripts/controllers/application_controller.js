App.ApplicationController = Ember.ObjectController.extend({
  image_path: function() {
    return window.images['me'];
  }.property(),

  pageClass: function() {
    return this.get("currentPath").replace(".", "_");
  }.property("currentPath"),
});
