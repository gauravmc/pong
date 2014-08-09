class Pong.Entity
  constructor: ->
    @width = 0
    @height = 0
    @color = '#fff'
    @setDefaultPosition()
    @setDefaultVelocities()

  setDefaultPosition: ->
    @x = 0
    @y = 0

  setDefaultVelocities: ->
    @xVelocity = 0
    @yVelocity = 0

  draw: (context) ->
    context.fillStyle = @color
    context.fillRect @x, @y, @width, @height

  hasCollidedWith: (entity) ->
    return !(
      ((@y + @height) < (entity.y)) ||
      (@y > (entity.y + entity.height)) ||
      ((@x + @width) < entity.x) ||
      (@x > (entity.x + entity.width))
    )

  game_width: ->
    Pong.Game.WIDTH

  game_height: ->
    Pong.Game.HEIGHT
