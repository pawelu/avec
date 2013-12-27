Avec.Routers.Router = Backbone.Router.extend({
  routes: {
    'users': 'index'
  },

  start: function(){
    Backbone.history.start({pushState: true});
  },

  index: function() {
    console.log('users#index')
  }
})
