Avec.Views.User = Backbone.Marionette.ItemView.extend({
  tagName: 'tr',

  render: function() {
    var template = HandlebarsTemplates['user'];
    this.$el.append(template(this.model.toJSON()));

    return this;
  }
});
