require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it 'is invalid when email is absent' do
    subject.username = 'johndoe'
    subject.password = 'password'
    expect(subject).to_not be_valid
  end

  it 'is invalid when username is absent' do
    subject.email = 'johndoe@test.com'
    subject.password = 'password'
    expect(subject).to_not be_valid
  end

  it 'is invalid when password is absent' do
    subject.username = 'johndoe'
    subject.email = 'johndoe@test.com'
    expect(subject).to_not be_valid
  end

  it 'is valid when all 3 attributes are present' do
    subject.username = 'johndoe'
    subject.password = 'password'
    subject.email = 'johndoe@test.com'
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:appointments) }
    it { should have_many(:coaches) }
  end
end
