class Knockout.Models.Team extends Backbone.Model
  
  win: ->
    @set(eliminated: false)
    @save()

  eliminate: ->
    @set(eliminated: true)
    @save()