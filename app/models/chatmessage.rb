class Chatmessage < ApplicationRecord
  belongs_to :user
  belongs_to :chatgroup

  validates :message, length: { in: 1..75 }
end
