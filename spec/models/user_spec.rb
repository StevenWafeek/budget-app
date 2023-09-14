require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'User1', email: 'test2@mail.com', password: '123456')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be empty' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'User1'
    expect(subject).to be_valid
  end
end
