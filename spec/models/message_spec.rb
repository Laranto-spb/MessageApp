require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Validation' do
    let!(:user) do
      User.create(name: 'Test')
    end

    let!(:chat) do
      ChatRoom.create
    end

    let!(:message) { Message.create(body: "Hello, my name is Test", user_id: user.id, chat_room_id: chat.id)}

    it 'not empty' do
      message.body = nil
      expect(message).not_to be_valid
    end

    it 'not to long' do
      message.body = "text" * 50
      expect(message).not_to be_valid
    end

    it 'not to short' do
      message.body = "A"
      expect(message).not_to be_valid
    end
  end

  describe 'CRUD' do
    let!(:user) do
      User.create(name: 'Test')
    end

    let!(:chat) do
      ChatRoom.create
    end

    it 'creates new message' do
      Message.create(body: "New message", user_id: user.id, chat_room_id: chat.id)
      expect(chat.messages.any?).to be_truthy
    end
  end
end
