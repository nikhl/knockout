window.Knockout =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Knockout.Routers.Teams()
    Backbone.history.start()

$(document).ready ->
  Knockout.initialize()
