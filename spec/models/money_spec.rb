require 'rails_helper'

RSpec.describe Money, type: :model do
  describe '#valid' do
    context 'success' do
      let(:money) { build(:money, price: 0) }
      it { expect(money).to be_valid }
    end

    context 'price nil' do
      let(:money) { build(:money, price: nil) }
      it { expect(money).to be_invalid }
    end
  end
end
