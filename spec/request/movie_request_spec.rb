# frozen_string_literal: true

require 'rails_helper'

describe '#index', type: :request do
  context 'when movies available' do
    before { get '/movies' }
    it { expect(response).to have_http_status(:ok) }
  end
end

describe '#create', type: :request do
  context 'when valid' do
    before do
      post '/movies', params: { movie: {
        imdb_id: 'some_imdb_id',
        title: 'Hobbit',
        rating: 4.5,
        rank: 10,
        year: 2010
      } }
    end

    it { expect(response).to have_http_status(302) }

    it 'increase movies count' do
      expect do
        post '/movies', params: { movie: {
          imdb_id: 'some_imdb_id',
          title: 'Hobbit',
          rating: 4.5,
          rank: 10,
          year: 2010
        } }
      end.to change { Movie.count }.by(1)
    end
  end

  context 'when not valid' do
    before do
      post '/movies', params: { movie: {
        imdb_id: '',
        title: '',
        rating: 4.5,
        rank: 10,
        year: 2010
      } }
    end

    it { expect(response).to have_http_status(:unprocessable_entity) }

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
    end
  end
end
