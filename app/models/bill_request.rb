class BillRequest < ApplicationRecord
  validates :message, :bill, :manager, presence: true
  belongs_to :bill
  belongs_to :manager
end
