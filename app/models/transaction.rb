class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'Bill', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'Bill', foreign_key: 'recipient_id'
  validates :amount, presence: true
  validates_associated :recipient, :sender
end
