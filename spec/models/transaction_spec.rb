require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:sender) }
    it { is_expected.to validate_presence_of(:recipient) }
    it { is_expected.to validate_numericality_of(:amount) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:sender).class_name('Bill').with_foreign_key('sender_id') }
    it { is_expected.to belong_to(:recipient).class_name('Bill').with_foreign_key('recipient_id') }
  end
end
