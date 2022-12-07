# frozen_string_literal: true

require 'rails_helper'

describe '#index', type: :request do
  context 'when users available' do
    before { get '/users' }
    it { expect(response).to have_http_status(:ok) }
  end
end

describe '#create', type: :request do

  def send_post_request
    post '/users', params: { user_form: {
        first_name: 'Daniel',
        last_name: 'Martinez',
        role: 'Admin',
        password: 'password',
        email: 'sample@sample.com'
      } }
  end

  context 'when validate the model user' do

    context 'when attributes are present' do
      it 'does increase users count' do
        expect do
          send_post_request
        end.to change { User.count }.by(1)
        expect(response).to have_http_status(302)
      end
    end

    context 'when Role is empty' do
      it 'does not increase User count' do
        expect do
          post '/users', params: { user_form: {
            first_name: 'Daniel',
            last_name: 'Martinez',
            role: '',
            password: '',
            email: 'sample@sample.com'
          } }
        end.to change { User.count }.by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when Password is empty' do
      it 'does not increase User count' do
        expect do
          post '/users', params: { user_form: {
            first_name: 'Daniel',
            last_name: 'Martinez',
            role: '',
            password: '',
            email: 'sample@sample.com'
          } }
        end.to change { User.count }.by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  

end
