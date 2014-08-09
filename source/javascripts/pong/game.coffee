class Pong.Game
  @WIDTH: 1280
  @HEIGHT: 720

  constructor: (canvas) ->
    @context = canvas.getContext '2d'

    @entities = [
      new Pong.Background,
      paddle = new Pong.Paddle,
      ball = new Pong.Ball(paddle),
      new Pong.BotPaddle(ball)
    ]

  start: ->
    fps = 60
    interval = 1000/fps

    setInterval =>
      @update()
      @draw()
    , interval

  update: ->
    entity.updateStatus() for entity in @entities when entity.updateStatus

  draw: ->
    entity.draw(@context) for entity in @entities when entity.draw
