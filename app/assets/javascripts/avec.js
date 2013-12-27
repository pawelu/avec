window.Avec = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(){
    var app = new Avec.Routers.Router();
    app.start();
  }
}

$(function(){
  Avec.initialize()
});
