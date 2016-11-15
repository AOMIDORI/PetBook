// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);
