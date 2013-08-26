//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require blog

// for more details see: http://emberjs.com/guides/application/
App = Ember.Application.create();

//= require_tree .

// Auto load pictures to make website snappier
$(document).ready(function() {
  setTimeout(function() {
    var img;

    for (i in window.images) {
      img = new Image;
      img.src = window.images[i];
    }
  }, 600);
});
