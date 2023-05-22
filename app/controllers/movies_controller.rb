class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      flash[:success] = "#{@movie.title}の投稿を作成しました。"
      @movie.img = "movie_no_images.png"
      redirect_to [@movie.user, @movie]
    else
      render 'new'
    end
  end
  
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :screentime, :director, :detail,:impression, :img)
  end
end