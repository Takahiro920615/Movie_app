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
    @user = User.new(user_params)
    if @user.save
      if @user.picture.nil?
        @user.picture = "public/user_images/no_image.png"
      end
      flash[:success] = "ユーザー登録しました"
    
      redirect_to @user
    else
      flash.now[:danger]="ユーザー登録に失敗しました"
      render :new
    end
  end

  private
  
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation,:picture).merge(picture: "no_image.png")
  end

end