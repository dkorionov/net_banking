class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable, :lockable, :confirmable

  validates :email, :full_name, :birthday, :gender, :phone, presence: true
  validates :encrypted_password, length: {minimum: 6}
  validates :phone, length: {minimum: 9, maximum: 11}
  validates :encrypted_password, confirmation: true, presence: true
  enum gender: %i[male female]
  has_many :bills, dependent: :delete_all
  validates_associated :bills
end
