require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(id: 1, name: 'user1', email: 'test@mail.com', password: '123456') }
  let(:group) { Group.create(id: 2, name: 'Shopping', icon: 'img1.png', user_id: user.id) }
  let(:payment) { Payment.create(id: 1, name: 'Dress', amount: 12, user_id: user.id) }
  let(:payment_group) { PaymentGroup.create(id: 1, group_id: group.id, payment_id: payment.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(payment).to be_valid }
    end

    it 'valid payment_group' do
      expect(payment_group).to be_valid
    end

    it 'should valid name ' do
      payment.name = nil
      expect(payment).to_not be_valid
    end
    it 'should valid amount ' do
      payment.amount = -10
      expect(payment).to_not be_valid
    end
    it 'should valid amount ' do
      payment.amount = 10
      expect(payment).to be_valid
    end
  end
end
