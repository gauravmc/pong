#= require ./paddle

class Pong.BotPaddle extends Pong.Paddle
  constructor: (@ball) ->
    super
    @userControlled = false

  setDefaultPosition: ->
    @x = @game_width() - 40
    @y = @game_height()/2 - @height/2

  updateStatus: ->
    @y += @ball.yVelocity unless @ball.isOutOfBounds()
    @ensureNoTrespassing()
    @handleCollisionWithBall()
