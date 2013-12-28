Avec.Routers.Router = Backbone.Router.extend({
  routes: {
    'users': 'index'
  },

  start: function(){
    Backbone.history.start({pushState: true});
  },

  index: function() {
    var users = new Avec.Collections.Users();
    users.fetch();

    var usersView = new Avec.Views.Users({ collection: users });
    usersView.render();
  }
})
