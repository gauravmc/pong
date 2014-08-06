class Pong.Ball
  constructor: (game_width, game_height) ->
    @width = 20
    @height = 20
    @x = game_width/2 - @width
    @y = game_height/2 - @height
    @xVelocity = 0
    @yVelocity = 0

  update: ->
    @x += @xVelocity
    @y += @yVelocity

  draw: (context) ->
    context.fillStyle = '#fff'
    context.fillRect @x, @y, @width, @height
