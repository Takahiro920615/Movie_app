require 'rest-client'

class TmdbService
  API_KEY = 'e33ff0c7f811c7e23b111aeebcd9add0'.freeze
  BASE_URL = 'https://api.themoviedb.org/3'.freeze

  def self.get_movies_in_japan
    url = "#{BASE_URL}/movie/now_playing?region=JP&api_key=#{API_KEY}"
    response = RestClient.get(url)
    JSON.parse(response.body)['results']
  end
end