# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :chats_list, only: [:index]
  before_action :set_chat, only: [:show]
  def index; end

  def show; end

  def create
    chat = ChatRoom.create(chat_params)
    redirect_to chat_room_path(chat.id) if chat.save
  end

  private

  def chats_list
    @chats = current_user.chat_rooms.sort { |a, b| b.messages.last <=> a.messages.last }
  end

  def set_chat
    chat = ChatRoom.find(params[:id])
    @messages = chat.messages
    return if chat.user_ids.include? current_user.id

    flash[:alert] = 'You must be the owner of this chat'
    redirect_to root_path
  end

  def chat_params
    params.require(:chat).permit(user_ids: [])
  end
end
