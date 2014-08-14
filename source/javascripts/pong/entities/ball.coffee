class Pong.Ball extends Pong.Entity
  constructor: ->
    super
    @width = 20
    @height = 20

  setDefaultPosition: ->
    @x = @game_width()/2 - @width
    @y = @game_height()/2 - @height

  setDefaultVelocities: ->
    @xVelocity = -10
    @yVelocity = 10

  updateStatus: ->
    @bounceBackFromUpperAndLowerEdges()
    @travel()

  bounceOffPaddle: (paddle) ->
    @xVelocity *= -1
    if paddle.goingUp()
      @yVelocity += (paddle.yVelocity / 1.7)
      @yVelocity *= -1 if @goingDownwards()
    else if paddle.goingDown()
      @yVelocity += -(paddle.yVelocity / 1.7)
      @yVelocity *= -1 if @goingUpwards()

  isOutOfBounds: ->
    (@x + @width > @game_width()) || (@x < 0)

  travel: ->
    @x += @xVelocity
    @y += @yVelocity

  bounceBackFromUpperAndLowerEdges: ->
    @yVelocity *= -1 if @collidedWithLowerEdge() || @collidedWithUpperEdge()

  goingUpwards: ->
    @yVelocity < 0

  goingDownwards: ->
    @yVelocity > 0
