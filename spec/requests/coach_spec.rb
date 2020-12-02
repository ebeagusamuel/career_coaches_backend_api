require 'rails_helper'

RSpec.describe 'Coach API', type: :request do
  let!(:coaches) { create_list(:coach, 10) }
  let!(:auto_user) { create(:user) }
  let!(:token) { JWT.encode({ user_id: auto_user.id }, 'gerrad199') }
  let!(:req_headers) { { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" } }


  describe 'GET /coaches' do
    before { get '/coaches', headers: req_headers, as: :json}


    it 'returns a json object' do
      expect(json['coaches'].size).to be(10)
    end
  end
end