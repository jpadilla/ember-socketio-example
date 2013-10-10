module.exports = App.IndexController = Ember.ArrayController.extend
    content: []

    init: ->

        App.socket.on 'initialized', (data) =>
            @pushObject(data.message)

        App.socket.on 'item_added', (data) =>
            @pushObject data.message

        App.socket.on 'session_connected', (data) =>
            @pushObject "Session #{data.sessionid} is online."

    actions:
            addMessage: ->
                message = "Session #{App.socket.socket.sessionid} wrote: #{@get 'message'}"
                @pushObject message

                App.socket.emit 'item_added',
                    message: message

                @set 'message', ''
