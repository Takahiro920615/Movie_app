class FavoritesController < ApplicationController
  before_action :set_movie
  def create
    current_user.favorite(@movie)
    redirect_to current_user
    flash:[:success] = "いいねしました！"
  end

  def destroy
    current_user.unfavorite(@movie)
    redirect_to current_user
    flash:[:primary] = "いいねを取り消しました"
    
  end

  private
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
end