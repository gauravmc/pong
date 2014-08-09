class Pong.Ball extends Pong.Entity
  constructor: (@paddle) ->
    super
    @width = 20
    @height = 20
    @setDefaultPosition()
    @setDefaultVelocities()

  setDefaultPosition: ->
    @x = @game_width()/2 - @width
    @y = @game_height()/2 - @height

  setDefaultVelocities: ->
    @xVelocity = -10
    @yVelocity = 10

  updateStatus: ->
    @bounceBackFromUpperAndLowerEdges()
    @travel()
    @handleCollision()

  handleCollision: ->
    if @hasCollidedWith(@paddle)
      @xVelocity *= -1
      if @paddle.goingUp()
        @yVelocity += (@paddle.yVelocity / 1.7)
        @yVelocity *= -1 if @goingDownwards()
      else if @paddle.goingDown()
        @yVelocity += -(@paddle.yVelocity / 1.7)
        @yVelocity *= -1 if @goingUpwards()

  travel: ->
    @x += @xVelocity
    @y += @yVelocity

  bounceBackFromUpperAndLowerEdges: ->
    @yVelocity *= -1 if @collidedWithLowerEdge() || @collidedWithUpperEdge()

  collidedWithLowerEdge: ->
    @y == @game_height() - @height

  collidedWithUpperEdge: ->
    @y == 0

  goingUpwards: ->
    @yVelocity < 0

  goingDownwards: ->
    @yVelocity > 0
