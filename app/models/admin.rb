class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :timeoutable,
         :trackable, :authentication_keys => [:login]
  validates :login, presence: true, uniqueness: true

  def email_required?
    false
  end


  def will_save_change_to_email?
    false
  end
end
