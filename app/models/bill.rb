class Bill < ApplicationRecord
  belongs_to :user
  validates :bill_type, presence: true
  enum bill_type: %i[deposit credit]
  has_many :make_transactions, class_name: 'Transaction', foreign_key: 'sender_id', dependent: :delete_all
  has_many :get_transactions, class_name: 'Transaction', foreign_key: 'recipient_id', dependent: :delete_all;
  has_many :manager_notifications
  has_one :bill_request, dependent: :destroy
  validates_associated :make_transactions, :get_transactions, :bill_request
end
