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
      redirect_to menu_types_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:menu_type).permit(:name)
  end

end