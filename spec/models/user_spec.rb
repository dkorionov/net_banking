require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_confirmation_of(:encrypted_password).on(:create) }
    it { is_expected.to validate_length_of(:encrypted_password).is_at_least(6) }
    it { is_expected.to validate_length_of(:phone).is_at_least(9) }
    it { is_expected.to validate_length_of(:phone).is_at_most(11) }
    it { is_expected.to validate_inclusion_of(:gender).in_array(%w[male female]) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:bills) }
  end

end
