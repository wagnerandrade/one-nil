class MatchContext

  @MATCH_LENGTH = 90
  @PLAYERS_LUCK = 20

  constructor: (@match) ->
    @time = 0
    @field = 0
    @isOver = no
    @score = { home: 0, away: 0 }
    @attacker = @match.home.getPlayer()
    @blocker = @match.away.getPlayer()

  next: ->
    @time++
    @isOver = @time >= MatchContext.MATCH_LENGTH

  attackerVsBlocker: ->
    @luck() or @match.system.test(@attacker.player.att, @blocker.player.def)

  attackerVsKeeper: ->
    @blocker = @blocker.squad.getKeeper()
    @luck() or @match.system.test(@attacker.player.att, @blocker.player.gk)

  luck: -> @match.system.oneIn(MatchContext.PLAYERS_LUCK)

  swapPlayers: ->
    aux = @attacker
    @attacker = @blocker
    @blocker = aux

  isHomeAttacker: -> @match.home.players.indexOf(@attacker) isnt -1

module.exports = MatchContext
