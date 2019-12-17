class ManagerNotification < ApplicationRecord
  validates :message, presence: true
end
