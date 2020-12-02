require 'rails_helper'

RSpec.describe 'Coach API', type: :request do
  let!(:coaches) { create_list(:coach, 10) }

  describe 'GET /coaches' do
    before { get '/coaches' }

    it 'returns a json object' do
      expect(json).not_to be_empty
    end
  end
end