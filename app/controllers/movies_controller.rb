class MoviesController < ApplicationController
  before_action :set_user

  def new
    @movie = Movie.new
  end

  def create
    @movie = @user.movies.create(movie_params)
    if @movie.save
      flash[:success] = "#{@movie.title}の投稿を作成しました。"
      redirect_to user_path(current_user)
    else
      flash[:danger]="新規投稿に失敗しました"
    end
  end
  
  def index
    @movies = Movie.all
    debugger
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :screentime, :director, :detail,:impression)
  end

  def set_user
    @user = current_user
  end
end