require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:short_code) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:cities) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:short_code) }
  end
end
