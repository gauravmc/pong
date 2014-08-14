class Pong.Ball extends Pong.Entity
  constructor: ->
    super
    @width = 20
    @height = 20

  setDefaultPosition: ->
    @x = @game_width()/2 - @width
    @y = @game_height()/2 - @height

  setDefaultVelocities: ->
    randomNum = Math.floor(Math.random() * (10 - 5 + 1) + 5)
    @yVelocity = if Math.random() < 0.5 then -randomNum else randomNum
    @xVelocity = if Math.random() < 0.5 then -10 else 10

  updateStatus: ->
    @bounceBackFromUpperAndLowerEdges()
    @travel()
    @reset() if @isOutOfBounds()

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

  reset: ->
    @setDefaultPosition()
    @setDefaultVelocities()

  bounceBackFromUpperAndLowerEdges: ->
    @yVelocity *= -1 if @collidedWithLowerEdge() || @collidedWithUpperEdge()

  goingUpwards: ->
    @yVelocity < 0

  goingDownwards: ->
    @yVelocity > 0
