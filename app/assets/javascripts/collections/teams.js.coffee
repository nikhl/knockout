class Knockout.Collections.Teams extends Backbone.Collection

  model: Knockout.Models.Team
  
  url: '/api/teams'
  
  knockoutOne: ->
    #knockedOutTeam = @shuffle()[0]
    remainingTeams = @where({eliminated: false})
    if remainingTeams.length == 0
      alert "All teams have been knockedout"
      return false
    else
      knockedOutTeam = fisherYates(remainingTeams)[0]
      if knockedOutTeam
        knockedOutTeam.set(eliminated: true)
        knockedOutTeam.save()

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