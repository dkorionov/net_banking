require 'rails_helper'

RSpec.describe Bill, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:bill_type) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:bill_request) }
    it { is_expected.to validate_inclusion_of(:bill_type).in_array(%w[credit deposit]) }
    it { is_expected.to validate_numericality_of(:amount) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:make_transactions).class_name('Transaction').with_foreign_key('sender_id') }
    it { is_expected.to have_many(:get_transactions).class_name('Transaction').with_foreign_key('recipient_id') }
    it { is_expected.to have_many(:manager_notifications) }
    it { is_expected.to have_one(:bill_request) }
  end
end
