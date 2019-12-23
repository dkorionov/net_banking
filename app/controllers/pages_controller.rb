class PagesController < ApplicationController

  def index
    if user_signed_in?
      redirect_to users_user_profile_path(current_user)
    elsif manager_signed_in?
      redirect_to managers_manager_profile_path(current_manager)
    end
  end
end
