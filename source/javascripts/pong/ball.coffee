class Pong.Ball extends Pong.Entity
  constructor: (game_width, game_height) ->
    super
    @width = 20
    @height = 20
    @x = game_width/2 - @width
    @y = game_height/2 - @height
    @xVelocity = 0
    @yVelocity = 10

  update: ->
    @yVelocity *= -1 if @y >= @game_height || @y <= 0
    @x += @xVelocity
    @y += @yVelocity

  draw: (context) ->
    super
