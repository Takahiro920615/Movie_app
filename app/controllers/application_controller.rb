class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def login(user)
    session[:user_id] = user.id
  end
end
