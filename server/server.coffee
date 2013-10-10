express = require('express')
app = require('express')()
server = require('http').createServer(app)
io = require('socket.io').listen(server)
config = require('../config').config

server.listen process.env.PORT || config.server.port
app.use express.static(__dirname + '/../public')

exports.startServer = ->
    io.sockets.on 'connection', (socket) ->
        socket.emit 'initialized',
            message: 'Socket connection initialized'

        socket.on 'item_added', (data) ->
            socket.broadcast.emit 'item_added', data

        socket.on 'session_connected', (data) ->
            socket.broadcast.emit 'session_connected', data
