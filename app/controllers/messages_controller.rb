# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)
    ActionCable.server.broadcast 'chatroom_channel', mod_message: render_message(@message) if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_room_id)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
