class Pong.Background extends Pong.Entity
  constructor: (game_width, game_height) ->
    super
    @width = @game_width
    @height = @game_height
    @color = '#000'
