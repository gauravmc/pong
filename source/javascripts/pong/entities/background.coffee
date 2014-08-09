class Pong.Background extends Pong.Entity
  constructor: ->
    super
    @width = @game_width()
    @height = @game_height()
    @color = '#000'
