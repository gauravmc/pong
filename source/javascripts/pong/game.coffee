class Pong.Game
  @WIDTH: 1280
  @HEIGHT: 720

  constructor: (canvas) ->
    @context = canvas.getContext '2d'

    @entities = [
      new Pong.Background,
      paddle = new Pong.Paddle,
      new Pong.Ball(paddle),
    ]

  start: ->
    fps = 60
    interval = 1000/fps

    setInterval =>
      @update()
      @draw()
    , interval

  update: ->
    entity.update() for entity in @entities when entity.update

  draw: ->
    entity.draw(@context, @width, @height) for entity in @entities when entity.draw
