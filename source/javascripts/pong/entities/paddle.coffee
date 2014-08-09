class Pong.Paddle extends Pong.Entity
  constructor: (@ball) ->
    super
    @width = 20
    @height = 120
    @userControlled = true
    $(window).on 'keyup keydown', @adjustPosition if @userControlled

  setDefaultPosition: ->
    @x = 20
    @y = @game_height()/2 - @height/2

  setDefaultVelocities: ->
    @xVelocity = 0
    @yVelocity = 0

  updateStatus: ->
    @y += @yVelocity
    @handleCollisionWithBall()
    @ensureNoTrespassing()

  handleCollisionWithBall: ->
    @ball.bounceOffPaddle(@) if @hasCollidedWith(@ball)

  adjustPosition: (event) =>
    if event.type == 'keydown'
      if event.keyCode == 38 # up arrow
        @yVelocity = -15
      else if event.keyCode == 40 # down arrow
        @yVelocity = 15
    else if event.type == 'keyup'
      @yVelocity = 0

  ensureNoTrespassing: ->
    @y = 0 if @y <= 0
    @y = @game_height() - @height if @y >= @game_height() - @height

  goingUp: ->
    @yVelocity < 1

  goingDown: ->
    @yVelocity > 1
