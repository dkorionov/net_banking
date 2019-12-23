class Managers::MainController < ApplicationController
  def dashboard
    @manager = Manager.friendly.find(params[:id])
  end
end
