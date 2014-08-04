#= require_tree ./pong

canvas = $('canvas')[0]
game = new Pong.Game(canvas)
game.start()
canvas.focus()
