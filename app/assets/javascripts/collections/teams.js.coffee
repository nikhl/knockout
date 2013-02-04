class Knockout.Collections.Teams extends Backbone.Collection

  model: Knockout.Models.Team
  
  url: '/api/teams'
  
  knockoutOne: ->
    remainingTeams = @where({eliminated: null})
    if remainingTeams.length == 2
      remainingTeams[0].eliminate()
      remainingTeams[1].win()
    else
      knockedOutTeam = fisherYates(remainingTeams)[0]
      if knockedOutTeam
        knockedOutTeam.eliminate()

  # Randomizes the order of elements in the passed in array in place.
  fisherYates = (arr) ->
    i = arr.length
    if i == 0 then return false
    while --i
      j = Math.floor(Math.random() * (i+1))
      tempi = arr[i]
      tempj = arr[j]
      arr[i] = tempj
      arr[j] = tempi
    return arr