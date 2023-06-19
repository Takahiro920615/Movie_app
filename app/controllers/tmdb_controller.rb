class TmdbController < ApplicationController
  def index
    @tmdb = TmdbService.get_movies_in_japan
  end
end