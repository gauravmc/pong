window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.oRequestAnimationFrame

class Pong.Game
  @WIDTH: 1280
  @HEIGHT: 720

  constructor: (canvas) ->
    @context = canvas.getContext '2d'

    @entities = [
      new Pong.Background,
      scoreboard = new Pong.Scoreboard
      ball = new Pong.Ball(scoreboard),
      new Pong.PlayerPaddle(ball),
      new Pong.BotPaddle(ball),
    ]

    @fps = 60
    @interval = 1000/@fps

  start: ->
    @updateAt = new Date().getTime()
    @onNewFrame()

  onNewFrame: ->
    window.requestAnimationFrame =>
      @redrawWithfixedTimeStep()
      @onNewFrame()

  redrawWithfixedTimeStep: ->
    updated = false

    while @updateAt <= new Date().getTime()
      @update()
      updated = true
      @updateAt += @interval

    @draw() if updated

  update: ->
    entity.updateStatus() for entity in @entities when entity.updateStatus

  draw: ->
    entity.draw(@context) for entity in @entities when entity.draw
