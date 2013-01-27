class Knockout.Views.TeamsIndex extends Backbone.View

  _teamViews = {}

  template: JST['teams/index']
  
  events:
    'submit #new_team_form': 'createTeam'
    'click .delete_btn': 'deleteTeam'
    'click .knockout_btn': 'knockoutTeam'
  
  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTeam, this)
    @collection.on('remove', @removeTeam, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTeam)
    this

  createTeam: (event) ->
    event.preventDefault()
    attrs = name: $('#new_team_name').val()
    @collection.create attrs,
      wait: true
      success: -> $('#new_team_name')[0].value = ""
      error: @displayError

  appendTeam: (team) ->
    view = new Knockout.Views.Team(model: team)
    _teamViews[team.get('id')] = view
    $('#teams').append(view.render().el)

  removeTeam: (team) ->
    _teamViews[team.get('id')].remove()

  displayError: (team, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attr, message of errors
        alert "#{attr} #{message}"

  deleteTeam: (event) ->
    team = @collection.get($(event.currentTarget).data('id'))
    team.destroy()

  knockoutTeam: (event) ->
    alert "In knockout"
