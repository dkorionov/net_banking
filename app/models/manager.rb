class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :timeoutable, :trackable
  validates :login, :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :encrypted_password, length: {minimum: 6}
  has_many :bill_requests, dependent: :delete_all
  has_many :manager_notifications
  validates :encrypted_password, confirmation: true, on: :update
  validates_associated :bill_requests, :manager_notifications
end
