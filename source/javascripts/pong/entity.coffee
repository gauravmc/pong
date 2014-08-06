class Pong.Entity
  constructor: ->
    @width = 0
    @height = 0
    @x = 0
    @y = 0
    @color = '#fff'

  draw: (context) ->
    context.fillStyle = @color
    context.fillRect @x, @y, @width, @height
