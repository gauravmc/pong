class Pong.Game
  constructor: (canvas) ->
    @context = canvas.getContext '2d'
    @width = canvas.width
    @height = canvas.height
    @entities = [
      new Pong.Background(@width, @height),
      paddle = new Pong.Paddle(@width, @height)
      new Pong.Ball(@width, @height, paddle)
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
