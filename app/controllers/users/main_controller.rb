class Users::MainController < ApplicationController

  def dashboard
    @user = User.friendly.find(params[:id])
  end


end
