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
    @handleCollision()

  handleCollision: ->
    if @has_collided_with(@paddle)
      @xVelocity *= -1
      if @paddle.goingUp()
        @yVelocity += (@paddle.yVelocity / 1.7)
        @yVelocity *= -1 if @goingDownwards()
      else if @paddle.goingDown()
        @yVelocity += -(@paddle.yVelocity / 1.7)
        @yVelocity *= -1 if @goingUpwards()

  goingUpwards: ->
    @yVelocity < 0

  goingDownwards: ->
    @yVelocity > 0
