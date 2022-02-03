require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Paka', email: 'example@mail.com', password: 'mypassword')
  end
  before { subject.save }
  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'Paka'
    expect(subject).to be_valid
  end

  it 'should not be greater than 100' do
    subject.name = 'Paka'*100
    expect(subject).to_not be_valid
  end
end
