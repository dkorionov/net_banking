class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable, :lockable, :confirmable

  extend FriendlyId
  friendly_id :full_name, use: :slugged

  validates :email, :full_name, :birthday, :gender, :phone, presence: true
  validates :email, uniqueness: true
  validates :encrypted_password, length: {minimum: 6}, presence: true
  validates :phone, length: {minimum: 9, maximum: 11}
  validates :encrypted_password, confirmation: true, on: %i[create update]
  validates :gender, inclusion: {in: %w(male female)}
  has_many :bills, dependent: :destroy
  validates_associated :bills

  def execute_command(command)
    command.execute
  end


end
