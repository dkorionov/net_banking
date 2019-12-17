require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:login) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:manager_notifications) }
    it { is_expected.to have_many(:bill_requests) }
    it { is_expected.to validate_uniqueness_of(:login) }
  end
end
