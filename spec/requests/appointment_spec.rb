require 'rails_helper'

RSpec.describe 'Appointments API', type: :request do
  let!(:coach) { create(:coach) }
  let!(:auto_user) { create(:user) }
  let(:appointment) { create(:appointment, user_id: auto_user.id, coach_id: coach.id) }
  let(:a) do
    { date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      coach_id: coach.id }
  end
  let!(:token) { JWT.encode({ user_id: auto_user.id }, 'gerrad199') }
  let!(:req_headers) { { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" } }

  describe 'GET /appointments' do
    context 'when the current user is not authorized' do
      before { get '/appointments' }

      it 'invalidates an un-authorized user' do
        expect(json['message']).to eq('Please log in')
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when the current user is authorized' do
      it 'returns appointments' do
        Appointment.create!(user_id: auto_user.id, coach_id: coach.id,
                            date_and_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now))
        get '/appointments', headers: req_headers, as: :json

        expect(json).not_to be_empty
        expect(response).to have_http_status(200)
        expect(json.size).to eq(1)
      end
    end
  end

  describe 'POST /book_appointment' do
    context 'when the request is valid' do
      before { post '/book_appointment', params: a, headers: req_headers, as: :json }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/book_appointment', params: { coach_id: coach.id }, headers: req_headers, as: :json }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['error']).to be_a(String)
      end
    end
  end

  describe 'DELETE /cancel_appointment' do
    before { delete '/cancel_appointment', params: { coach_id: coach.id }, headers: req_headers, as: :json }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
