class Knockout.Views.Team extends Backbone.View

  template: JST['teams/team']

  initialize: ->
    @model.on('change', @render, this)
    
  render: ->
    $(@el).addClass('team').html(@template(team: @model))
    this

  show: ->
    alert "will show the #{@model.get('id')}"
