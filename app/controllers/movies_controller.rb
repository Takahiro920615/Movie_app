class MoviesController < ApplicationController
  before_action :set_user, only:[:show,:create,:edit,:update]
  before_action :current_user, only: [:edit]
  before_action :require_login, only: [:edit]
  before_action :logged_in_user, only: [:edit,:update,:destroy]
  

 
  

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
    @current_user= current_user
  end

  def edit
    @user = current_user
    @movie = @user.movies.find_by(id: params[:id])
  end

  def update
    @movie = @user.movies.find(params[:id])
    if @movie.update(movie_update_params)
      flash[:success] = "#{@movie.title}の投稿更新しました。"
      redirect_to user_path(current_user)
    else
      flash[:danger]="新規投稿に失敗しました"
      render :edit
    end
  end

  def destroy
    @user= User.find(params[:user_id])
    @movie = @user.movies.find(params[:id])
   if
    @movie.destroy
    flash[:success]="#{@movie.title}のデータを削除しました"
    redirect_to current_user
   else
    flash[:danger]="投稿の削除に失敗しました。"
    redirect_to current_user
   end
  end





  private
  def movie_params
    params.require(:movie).permit(:title, :screentime, :director, :detail, :impression, :img)
  end

  def movie_update_params
    params.require(:movie).permit(:title, :screentime, :director, :detail, :impression, :img)
  end

  def set_user
    @user = current_user
  end

  def require_login
    unless logged_in?
      flash[:danger] = "ログインが必要です"
      redirect_to login_path
    end
  end

  def set_movie
    @movie= Movie.find(params[:id])
  end
  end

  

  