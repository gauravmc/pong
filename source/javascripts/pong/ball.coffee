class Pong.Ball extends Pong.Entity
  constructor: (game_width, game_height, paddle) ->
    super
    @width = 20
    @height = 20
    @x = game_width/2 - @width
    @y = game_height/2 - @height
    @xVelocity = -10
    @yVelocity = 10
    @paddle = paddle

  update: ->
    @yVelocity *= -1 if @y >= @game_height || @y <= 0
    @x += @xVelocity
    @y += @yVelocity
    @xVelocity *= -1 if @has_collided_with(@paddle)
