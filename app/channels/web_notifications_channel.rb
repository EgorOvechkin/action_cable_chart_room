class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "web_notifications_channel"
  end

  def speak(data)
    puts data["message"]
    ActionCable.server.broadcast 'web_notifications_channel', message: data["message"]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
