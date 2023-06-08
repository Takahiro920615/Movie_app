class FavoritesController < ApplicationController

  # ここは使っていない
 
  def create
    @movie_favorite = Favorite.new(user_id: current_user.id, movie_id: current_user.movie.id)
    @movie_favorite.save
    redirect_to current_user
  end

  def destroy
    @movie_favorite = Favorite.find_by(user_id: current_user.id, movie_id: current_user.movie.id)
    @movie_favorite.destroy
    redirect_to current_user
  end

  private
    
end