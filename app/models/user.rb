# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 2, maximum: 25 }
  has_many :messages
  has_many :user_chats
  has_many :chat_rooms, through: :user_chats
end
