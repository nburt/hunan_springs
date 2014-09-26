class WelcomeController < ApplicationController

  def index
    redirect_to menu_path
  end

end