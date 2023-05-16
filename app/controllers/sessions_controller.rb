class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success]="ようこそ#{user.name}さん！"
      redirect_to user
    else
      flash.now[:danger] = '入館できません'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    flash[:success]="ログアウトしました。"
    redirect_to root_url, status: :unprocessable_entity
  end
end