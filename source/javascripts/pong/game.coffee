class Pong.Game
  constructor: (screen) ->
    @screen = screen
    @entities = []

  start: ->
    fps = 60
    interval = 1000/fps

    setInterval =>
      @update()
      @draw()
    , interval

  update: ->
    entity.update() for entity in @entities when element.update

  draw: ->
    entity.draw(@screen) for entity in @entities when element.draw
