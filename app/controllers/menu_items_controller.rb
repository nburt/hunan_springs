class MenuItemsController < ApplicationController

  def new
    @menu_item = MenuItem.new
    @menu_types = MenuType.all
    @categories = Category.all
  end

  def create
    @menu_item = MenuItem.create!(strong_params)
    flash[:menu_item_success] = "#{@menu_item.name} was successfully added"
    redirect_to new_menu_item_path
  end

  private

  def strong_params
    params.require(:menu_item).permit(
      :name,
      :description,
      :price,
      :menu_type_id,
      :category_id
    )
  end

end