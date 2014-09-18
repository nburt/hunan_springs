module Admin
  class SessionsController < ApplicationController

    def new

    end

    def create
      if authenticated?(params[:username], params[:password])
        cookies.signed[:admin] = {:value => true, :expires => 1.days.from_now}
        flash[:login_success] = "Welcome, admin!"
        redirect_to admin_path
      else
        render :new
      end
    end

    private

    def authenticated?(username, password)
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end

  end
end