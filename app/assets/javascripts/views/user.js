Avec.Views.User = Backbone.Marionette.ItemView.extend({
  tagName: 'tr',

  templateContext: function(){
    var attributes = this.model.toJSON();
    var last_activity_at = moment(attributes.last_activity_at).format('D MMMM YYYY, HH:mm');

    return _.extend(attributes, {last_activity_at: last_activity_at});
  },

  render: function() {
    var template = HandlebarsTemplates['user'];
    this.$el.append(template(this.templateContext()));

    return this;
  }
});
