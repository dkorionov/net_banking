class ApplicationController < ActionController::Base
  helper_method :current_account
  helper_method :authenticate_account

  def current_account
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif session[:manager_id]
      @current_user_user ||= User.find(session[:manager_id])
    else
      @current_user = nil
    end
  end

  def authenticate_account
    unless current_user
      flash[:alert] = 'You need to sign in or sign up'
      redirect_to root_path
    end
  end


end
