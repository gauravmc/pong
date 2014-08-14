#= require ./paddle

class Pong.BotPaddle extends Pong.Paddle
  constructor: (@ball) ->
    super
    @userControlled = false

  setDefaultPosition: ->
    @x = @game_width() - 40
    @y = @game_height()/2 - @height/2

  updateStatus: ->
    @trackBallPosition()
    @y += @yVelocity
    @ensureNoTrespassing()
    @handleCollisionWithBall()

  trackBallPosition: ->
    return if @ball.isOutOfBounds()
    if @y < @ball.y
      @yVelocity += @speed unless @collidedWithLowerEdge()
    else if @y > @ball.y
      @yVelocity -= @speed unless @collidedWithUpperEdge()
