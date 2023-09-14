require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'User1', email: 'test@mail.com', password: '123456') }
  let(:group) { user.groups.create(name: 'shopping', icon: 'img1.png') }

  describe 'Validations' do
    it 'should be valid' do
      expect(group).to be_valid
    end

    it 'should allow valid name' do
      group.name = ''
      expect(group).to_not be_valid
    end

    it 'should allow valid name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'should allow valid user_id' do
      group.user_id = nil
      expect(group).to_not be_valid
    end
  end
end
