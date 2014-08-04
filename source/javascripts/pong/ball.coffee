class Pong.Ball
  constructor: (game) ->
    @width = 20
    @height = 20
    @x = game.width/2 - @width
    @y = game.height/2 - @height
    @xVelocity = 0
    @yVelocity = 0

  update: ->
    @x += @xVelocity
    @y += @yVelocity

  draw: (game) ->
    game.context.fillStyle = '#fff'
    game.context.fillRect @x, @y, @width, @height
