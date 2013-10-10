module.exports = Ember.Application.create
    LOG_TRANSITIONS: yes  # basic logging of successful transitions

    ready: ->
        @setSocketIO()

    setSocketIO: ->
        @set 'socket', io.connect()

        App.socket.on 'error', (err) ->
            console.log err

        App.socket.on 'connect', ->
            App.socket.emit 'session_connected',
                sessionid: App.socket.socket.sessionid
