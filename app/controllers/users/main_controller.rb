class Users::MainController < ApplicationController
  before_action :authenticate_user!
  before_action :set_main_menu

  def dashboard
    @user = params
  end


  private

  def set_main_menu
    @main_menu = {Bills: {name: 'Bills', path: users_bills_path},
                  Settings: {name: 'Settings', path: edit_user_registration_path}}
  end

end
