class Pong.Game
  constructor: (canvas) ->
    @context = canvas.getContext '2d'
    @height = canvas.height
    @width = canvas.width
    @entities = [
      new Pong.Background,
      new Pong.Ball(@)
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
    entity.draw(@) for entity in @entities when entity.draw
