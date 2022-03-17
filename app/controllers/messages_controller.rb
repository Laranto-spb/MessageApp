# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)
    redirect_to chat_room_path(message_params[:chat_room_id]) if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_room_id)
  end
end
