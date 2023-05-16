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
      log_in @user
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success]="#{@user.name}を削除しました"
    redirect_to users_url
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:picture).merge(picture: "no_image.png")
  end

  def user_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end