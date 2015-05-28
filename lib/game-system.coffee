class GameSystem

  @MIN_ATTR = 1
  @MAX_ATTR = 20
  @HALF_ATTR = @MAX_ATTR / 2
  @FOURTH_ATTR = @MAX_ATTR / 4

  randBetween: (initial, final) ->
    range = final - initial + 1
    randomBase = Math.random() * range + initial
    Math.floor(randomBase)

  rand: -> @randBetween(GameSystem.MIN_ATTR, GameSystem.MAX_ATTR)

  mod: (value) -> Math.floor(value / 2 - GameSystem.FOURTH_ATTR)

  test: (attribute, target) ->
    attributePlay = @rand() + @mod(attribute)
    testDifficult = GameSystem.HALF_ATTR + @mod(target)
    attributePlay > testDifficult

module.exports = GameSystem
