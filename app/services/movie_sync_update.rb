class MovieSyncUpdate < ApplicationService

  def initialize(movies)
    @movies = movies
  end

  def call
    parsed_movies = MovieParser.call(@movies)
    ActiveRecord::Base.transaction do
      parsed_movies.each do |movie|
        db_movie = Movie.find_by(imdb_id: movie[:imdb_id])
        if db_movie
          movie[:id] = db_movie.id
          movie[:created_at] = db_movie.created_at
          movie[:updated_at] = Time.now
          db_movie.update(movie.attributes)
        else
          movie.save
        end
      end
    end
  end

end