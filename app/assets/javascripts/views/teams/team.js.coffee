class Knockout.Views.Team extends Backbone.View

  template: JST['teams/team']
    
  render: ->
    $(@el).addClass('team').html(@template(team: @model))
    this
