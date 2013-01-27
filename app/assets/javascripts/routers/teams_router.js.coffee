class Knockout.Routers.Teams extends Backbone.Router
  routes:
    '': 'index'
    'teams/:id': 'show'

  initialize: ->
    @collection = new Knockout.Collections.Teams()
    @collection.fetch()

  index: ->
    view = new Knockout.Views.TeamsIndex(collection: @collection)
    $('#place-holder').html(view.render().el)

  show: (id) ->
    alert "Showing team with id #{id}"
