class Pong.Entity
  constructor: (game_width, game_height) ->
    @game_width = game_width
    @game_height = game_height
    @width = 0
    @height = 0
    @x = 0
    @y = 0
    @color = '#fff'

  draw: (context) ->
    context.fillStyle = @color
    context.fillRect @x, @y, @width, @height

  has_collided_with: (entity) ->
    return !(
      ((@y + @height) < (entity.y)) ||
      (@y > (entity.y + entity.height)) ||
      ((@x + @width) < entity.x) ||
      (@x > (entity.x + entity.width))
    )
