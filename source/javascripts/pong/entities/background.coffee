class Pong.Background
  draw: (game) ->
    game.context.fillStyle = '#000'
    game.context.fillRect 0, 0, game.width, game.height
