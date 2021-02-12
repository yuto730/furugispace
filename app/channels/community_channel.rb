class CommunityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "community_channel_#{params['community']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], user_id: current_user.id, community_id: params['community']
  end
end
