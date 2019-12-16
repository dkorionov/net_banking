class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable, :lockable, :confirmable

  validates :email, :full_name, :birthday, :gender, :phone, presence: true
  validates :encrypted_password, length: {minimum: 6}
  validates :encrypted_password, confirmation: true, presence: true

end
