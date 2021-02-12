class MessageBroadcastJob < ApplicationJob
  def perform(message)
    ActionCable.server.broadcast "community_channel#{message.community_id}", message: render_message(message)

  end

  private

  def render_message(message)
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: message }
  end
end
