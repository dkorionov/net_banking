class Bill < ApplicationRecord
  belongs_to :user
  validates :bill_type, :amount, presence: true
  validates :bill_type, inclusion: {in: %w[credit deposit]}
  validates :amount, numericality: true
  has_many :make_transactions, class_name: 'Transaction', foreign_key: 'sender_id', dependent: :destroy
  has_many :get_transactions, class_name: 'Transaction', foreign_key: 'recipient_id', dependent: :destroy
  has_many :manager_notifications
  has_one :bill_request, dependent: :destroy
  validates_associated :make_transactions, :get_transactions, :bill_request
  attr_accessor :name
end
