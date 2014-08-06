class Pong.Ball extends Pong.Entity
  constructor: (game_width, game_height) ->
    super
    @game_width = game_width
    @game_height = game_height
    @width = 20
    @height = 20
    @x = game_width/2 - @width
    @y = game_height/2 - @height
    @xVelocity = 10
    @yVelocity = 10

  update: ->
    @x += @xVelocity
    @y += @yVelocity

  draw: (context) ->
    super
    @yVelocity *= -1 if @y >= @game_height || @y <= 0
    @xVelocity *= -1 if @x >= @game_width || @x <= 0
