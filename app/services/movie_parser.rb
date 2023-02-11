class MovieParser < ApplicationService

def initialize(raw_movies)
  @raw_movies = raw_movies
end

def call
  parsed_movies = []
  json_raw_movies = JSON.parse(@raw_movies, symbolize_names: true)
  json_raw_movies[:items].each do |raw_movie|
    movie = Movie.new(imdb_id: raw_movie[:id], title: raw_movie[:title], rating: raw_movie[:imDbRating], rank: raw_movie[:rank], year: raw_movie[:year], data: raw_movie.to_s)
    parsed_movies << movie
  end
  parsed_movies
end

end