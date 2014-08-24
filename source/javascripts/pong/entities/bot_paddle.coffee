#= require ./player_paddle

class Pong.BotPaddle extends Pong.PlayerPaddle
  constructor: (@ball) ->
    super
    @speed = 5
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
    return if @ball.isOutOfBounds() || @ball.xVelocity <= 0
    if @y < @ball.y
      @yVelocity += @speed unless @collidedWithLowerEdge()
    else if @y > @ball.y
      @yVelocity -= @speed unless @collidedWithUpperEdge()
