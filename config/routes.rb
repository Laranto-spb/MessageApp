# frozen_string_literal: true

Rails.application.routes.draw do
  root "pages#home"
  resources :chat_rooms
  post 'messages', to: 'messages#create'
  post 'chats', to: 'chat_rooms#create'
end
