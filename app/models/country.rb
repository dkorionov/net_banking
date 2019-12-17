class Country < ApplicationRecord
  validates :name, :short_code, presence: true, uniqueness: true
  has_many :cities, dependent: :delete_all
  validates_associated :cities
end
