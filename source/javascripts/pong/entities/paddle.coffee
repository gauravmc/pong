class Pong.Paddle extends Pong.Entity
  constructor: (game_width, game_height) ->
    super
    @width = 20
    @height = 100
    @x = 20
    @y = @game_height/2 - @height/2
    @xVelocity = 0
    @yVelocity = 0
    $(window).on 'keyup keydown', @adjustPosition

  update: ->
    @y += @yVelocity
    @y = 0 if @y <= 0
    @y = @game_height - @height if @y >= @game_height - @height

  adjustPosition: (event) =>
    if event.type == 'keydown'
      if event.keyCode == 38 # up arrow
        @yVelocity = -10
      else if event.keyCode == 40 # down arrow
        @yVelocity = 10
    else if event.type == 'keyup'
      @yVelocity = 0

  goingUp: ->
    @yVelocity < 1

  goingDown: ->
    @yVelocity > 1

  stationary: ->
    @yVelocity == 0
