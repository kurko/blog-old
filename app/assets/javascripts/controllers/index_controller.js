App.IndexController = Ember.ObjectController.extend({
  software_index: function() {
    modelWrapper = Ember.ArrayController.create();
    this.loadArticlesByCategory("Software", modelWrapper);
    return modelWrapper;
  }.property(),

  essays_index: function() {
    modelWrapper = Ember.ArrayController.create();
    this.loadArticlesByCategory("Essays", modelWrapper);
    return modelWrapper;
  }.property(),

  personal_index: function() {
    modelWrapper = Ember.ArrayController.create();
    this.loadArticlesByCategory("Personal", modelWrapper);
    return modelWrapper;
  }.property(),

  loadArticlesByCategory: function(category, modelWrapper) {
    App.Text
      .find({category: category})
      .then(function(texts) {
        return modelWrapper.set("content", texts);
      });
  }
});
