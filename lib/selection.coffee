{ Squad } = require('../index')

class Selection

  @BLOCKERS = 5
  @ATTACKERS = 5

  constructor: (@system, @team) ->
    @players = @team.team.players.slice()

  createSquad: ->
    keeper = @slicedPlayersBy(1, (p) -> p.gk)
    attackers = @slicedPlayersBy(Selection.ATTACKERS, (p) -> p.att).reverse()
    blockers = @slicedPlayersBy(Selection.BLOCKERS, (p) -> p.def)
    new Squad(@system, @team, keeper.concat(blockers).concat(attackers))

  slicedPlayersBy: (size, func) ->
    selectedPlayers = @allPlayersBy(func).slice(0, size)
    @players = @purgePlayers(selectedPlayers)
    selectedPlayers

  purgePlayers: (array) -> @players.filter (p) -> array.indexOf(p) is -1

  allPlayersBy: (func) ->
    @players.sort((a, b) -> (func(b) or 0) - (func(a) or 0))

module.exports = Selection
