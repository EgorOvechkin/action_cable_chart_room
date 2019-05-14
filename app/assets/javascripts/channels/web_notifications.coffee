App.web_notifications = App.cable.subscriptions.create "WebNotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    _message = document.createElement('div')
    document.querySelector('#messages').appendChild(_message)
    _message.innerHTML = new Date().toLocaleTimeString() + '> ' + data.message;

listeners = () -> document.querySelector('#text-input').addEventListener "keydown", (event) ->
  if event.key is 'Enter'
    App.web_notifications.perform 'speak', message: event.target.value
    event.target.value = ''
    event.preventDefault

document.addEventListener "DOMContentLoaded", listeners
