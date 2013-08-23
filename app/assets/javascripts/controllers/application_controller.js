App.ApplicationController = Ember.ObjectController.extend({
  pageClass: function() {
    return this.get("currentPath").replace(".", "_");
  }.property("currentPath"),
});
