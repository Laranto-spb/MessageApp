class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { minimum: 2, maximum: 50 }
end
