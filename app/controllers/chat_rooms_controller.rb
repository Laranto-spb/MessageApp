# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :chats_list, only: [:index]
  before_action :set_chat, only: [:show]
  def index; end

  def show; end

  private

  def chats_list
    messages = current_user.messages.collect(&:chat_room_id)
    @chats = ChatRoom.all.where(id: messages)
  end

  def set_chat
    @chat = ChatRoom.find(params[:id])
    user_ids = @chat.messages.collect(&:user_id)
    return if user_ids.include? current_user.id

    flash[:alert] = 'You must be the owner of this chat'
    redirect_to root_path
  end
end
