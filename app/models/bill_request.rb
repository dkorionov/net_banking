class BillRequest < ApplicationRecord
  validates :message, presence: true
end
