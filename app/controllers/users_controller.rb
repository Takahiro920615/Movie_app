class UsersController < ApplicationController

  def login_page
  end

  def login
    @user=User.find_by(email: params[:email], password: params[:password])
    if @user
      flash[:notice]="ようこそ#{@user.name}さん"
      redirect_to user_url
    else
      render :login_page
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], picture: "no_image.png")
    if @user.save
      flash[:success] = "ユーザー登録しました"
      redirect_to user_url(@user)
    else
      flash[:danger] ="ユーザー登録に失敗しました"
      render :new
    end
  end

end