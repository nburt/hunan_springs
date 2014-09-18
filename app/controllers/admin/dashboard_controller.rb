module Admin
  class DashboardController < ApplicationController

    before_filter :is_admin?

    def index
      
    end

    private

    def is_admin?
      unless cookies.signed[:admin]
        redirect_to new_admin_session_path
      end
    end

  end
end