class MovieFetcher < ApplicationService

  def call
    response = MovieApi.new.most_popular_movies
    MovieSyncUpdate.call(response.body)
  end

end