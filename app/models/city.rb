class City < ApplicationRecord
  validates :name, :country, presence: true
  belongs_to :country
end
