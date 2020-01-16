class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to profile_users_path(current_user)
    elsif manager_signed_in?
      redirect_to profile_managers_path(current_manager)
    end
  end
end
