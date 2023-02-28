class MovieApi
  include HTTParty
  
  def initialize
    @headers = { headers: { 'Content-Type' => 'application/json' } }
  end



  def most_popular_movies
    self.class.get("https://imdb-api.com/en/API/MostPopularMovies/k_0uhr65oz", @headers)
  end

end