// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.resource('about');
  this.resource('texts', function() {
    this.route('show', { path: '/:text_id' });
  });
});
