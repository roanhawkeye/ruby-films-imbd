# frozen_string_literal: true

require 'rails_helper'

describe '#index', type: :request do
  context 'when movies available' do
    before { get '/movies' }
    it { expect(response).to have_http_status(:ok) }
  end
end

describe '#create', type: :request do
  context 'when validate the model movie' do

    def send_post_request
      post '/movies', params: { movie: {
        imdb_id: 'some_imdb_id',
        title: 'Hobbit',
        rating: 4.5,
        rank: 10,
        year: 2010
      } }
    end

    context 'when attributes are present' do 
      it 'does increase movies count' do
        expect do
          send_post_request
        end.to change { Movie.count }.by(1)
        expect(response).to have_http_status(302)
      end
    end

    context 'when title is empty' do
      it 'does not increase movies count' do
        expect do
          post '/movies', params: { movie: {
            imdb_id: '',
            title: '',
            rating: 4.5,
            rank: 10,
            year: 2010
          } }
        end.to change { Movie.count }.by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when imdb_id is empty' do
      it 'does not increase movies count' do
        expect do
          post '/movies', params: { movie: {
            imdb_id: '',
            title: '',
            rating: 4.5,
            rank: 10,
            year: 2010
          } }
        end.to change { Movie.count }.by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end
end
