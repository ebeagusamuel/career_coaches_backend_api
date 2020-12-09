require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:coach) }
  end
end
