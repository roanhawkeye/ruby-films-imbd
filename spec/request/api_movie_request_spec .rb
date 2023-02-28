# frozen_string_literal: true

require 'rails_helper'

describe '#index', type: :request do

  def build_jwt(valid_for_minutes = 5)
    exp = Time.now.to_i + (valid_for_minutes*60)
    payload = { "iss": "fusionauth.io",
                "exp": exp,
                "aud": "238d4793-70de-4183-9707-48ed8ecd19d9",
                "sub": "19016b73-3ffa-4b26-80d8-aa9287738677",
                "name": "Dan Moore",
                "roles": ["USER"]
    }

    JWT.encode payload, Rails.configuration.x.oauth.jwt_secret, 'HS256'

  end

  context 'when no jwt' do
    before { get '/api/v1/movies' }
    it { expect(response).to have_http_status(:forbidden) }
  end

  context 'when jwt provided' do

      it 'jwt is valid' do
        get '/api/v1/movies', headers: { "HTTP_AUTHORIZATION" => "Bearer " + build_jwt }
        expect(response).to have_http_status(:ok) 
      end

      it 'jwt is expired' do
        get '/api/v1/movies', headers: { "HTTP_AUTHORIZATION" => "Bearer " + build_jwt(-1) }
        expect(response).to have_http_status(:forbidden)
      end

  end

end
