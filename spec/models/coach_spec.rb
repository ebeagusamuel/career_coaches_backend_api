require 'rails_helper'

RSpec.describe Coach, type: :model do
  subject do
    described_class.new(name: 'John Doe',
                        location: 'My address', qualification: 'qualification',
                        charge_per_hour: '$50', phone_number: 'phone number')
  end

  it 'is valid when all the required attributes is present' do
    expect(subject).to be_valid
  end

  it 'is invalid when any of the required attributes is absent' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:appointments) }
    it { should have_many(:users) }
  end
end
