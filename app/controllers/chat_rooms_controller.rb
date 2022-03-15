# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :chats_list
  def index; end

  private

  def chats_list
    messages = current_user.messages.collect(&:chat_room_id)
    @chats = ChatRoom.all.where(id: messages)
  end
end
