class UsersController < ApplicationController

  def like
    @user= User.find(params[:user_id])
    @movie= Movie.find(params[:id])
    @movie.likes = true
    @movie.save
    redirect_to current_user
  end

  def unlike
    @user= User.find(params[:user_id])
    @movie= Movie.find(params[:id])
    @movie.likes = false
    @movie.save
    redirect_to current_user
  end


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
    @movie = @user.movies.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      # ここ変更したところ5/19
      if params[:user][:picture].present?
      @user.picture.attach(params[:user][:picture])
      else
        @user.picture = File.open('/public/user_images/no_image.png')
        @user.picture.attach(io: default_picture, filename: 'no_image.png')
      end
         flash[:success] = "ユーザー登録しました"
         redirect_to @user
    else
      flash.now[:danger]="ユーザー登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.picture.attach(params[:user][:picture]) 
    if @user.update(user_update_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success]="#{@user.name}を削除しました"
    redirect_to users_url
  end

  def user_image
    filename = params[:filename]
    send_file Rails.root.join('public', 'user_images', filename), type: 'image/png', disposition: 'inline'
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:picture)
  end

  def user_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
  end

  

end