require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:country) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:country) }
  end
end
