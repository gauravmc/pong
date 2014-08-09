class Pong.Paddle extends Pong.Entity
  constructor: ->
    super
    @width = 20
    @height = 120
    @x = 20
    @y = @game_height()/2 - @height/2
    @xVelocity = 0
    @yVelocity = 0
    @userControlled = true
    $(window).on 'keyup keydown', @adjustPosition

  update: ->
    @y += @yVelocity
    @ensureNoTrespassing()

  adjustPosition: (event) =>
    return unless @userControlled

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

  stationary: ->
    @yVelocity == 0
