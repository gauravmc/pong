class Pong.Scoreboard extends Pong.Entity
  constructor: ->
    super
    @font = '50px Arial'
    @x = @game_width() / 2
    @y = 70
    @playerScore = 0
    @botScore = 0

  draw: (context) ->
    context.font = @font
    context.textAlign = 'center'
    context.fillStyle = @color
    context.fillText @scoreText(), @x, @y

  scoreText: ->
    "#{@playerScore}                             #{@botScore}"
