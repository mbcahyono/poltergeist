class Poltergeist.Connection
  constructor: (@owner, @port) ->
    @socket = new WebSocket "ws://127.9.135.1:#{@port}/"
    @socket.onmessage = this.commandReceived
    @socket.onclose = -> phantom.exit()

  commandReceived: (message) =>
    @owner.runCommand(JSON.parse(message.data))

  send: (message) ->
    @socket.send(JSON.stringify(message))
