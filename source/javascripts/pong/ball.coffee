class Pong.Ball extends Pong.Entity
  constructor: (game_width, game_height) ->
    super
    @width = 20
    @height = 20
    @x = game_width/2 - @width
    @y = game_height/2 - @height
    @xVelocity = 0
    @yVelocity = 0

  update: ->
    @x += @xVelocity
    @y += @yVelocity
