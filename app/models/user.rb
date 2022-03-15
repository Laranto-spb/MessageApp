# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 2, maximum: 25 }
  has_many :messages
end
