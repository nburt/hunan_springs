module Admin
  class MenuTypesController < ApplicationController

    def index
      @menu_types = MenuType.all
    end

    def new
      @menu_type = MenuType.new
    end

    def create
      @menu_type = MenuType.new(strong_params)
      if @menu_type.save
        flash[:menu_type_success] = "Menu Type: #{@menu_type.name} was successfully created!"
        redirect_to admin_menu_types_path
      else
        render :new
      end
    end

    def edit
      @menu_type = MenuType.find(params[:id])
    end

    def update
      @menu_type = MenuType.find(params[:id])
      if @menu_type.update_attributes(strong_params)
        redirect_to admin_menu_types_path
      else
        render :edit
      end
    end

    def destroy
      menu_type = MenuType.find(params[:id])
      menu_type.destroy
      redirect_to admin_menu_types_path
    end

    private

    def strong_params
      params.require(:menu_type).permit(:name)
    end

  end
end