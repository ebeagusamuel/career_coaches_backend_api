require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user_details) { {username: 'JohnDoe',
    email: 'johndoe@test.com', password: 'password' } }

  before { post '/users', params: user_details }

  describe 'POST /users' do
    context 'when the request is valid' do
      it 'creates a user' do
        expect(json['user']['username']).to be_a(String)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { username: 'invalid' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['error']).to be_a(String)
      end
    end
  end

  describe 'POST /login' do
    context 'when user logs in with valid parameters' do
      let(:login_attributes) { { username: 'JohnDoe', password: 'password'} }
      before { post '/login', params: login_attributes }

      it 'logs in a user' do
        expect(json['user']).to_not be(nil)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user logs in with invalid parameters' do
      let(:login_attributes) { { username: 'invalid', password: 'invalid' } }
      before { post '/login', params: login_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['error']).to be_a(String)
      end
    end
  end

  describe 'GET /auto_login' do
    let(:login_attributes) { { username: 'JohnDoe', password: 'password' } }
    context 'when the current user is not authorized' do
      before { get '/auto_login' }

      it 'validates an un-authorized user' do
        expect(json['message']).to eq('Please log in')
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when the current user is authorized' do
      after { get '/auto_login' }

      it 'returns json object of the user' do
        expect(json).to_not be(nil)
      end
    end
  end
end