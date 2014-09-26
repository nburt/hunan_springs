class MenuController < ApplicationController
  def index
    if lunch_menu
      @menu_items = MenuItem.where(menu_type_id: MenuType.find_by(name: "Lunch").id)
      @class = "lunch"
    else
      @menu_items = MenuItem.where(menu_type_id: MenuType.find_by(name: "Dinner").id)
      @class = "dinner"
    end
  end

  private

  def lunch_menu
    params[:type] != "dinner" &&
      Time.parse("08:00:00 -0600") < Time.now &&
      Time.now < Time.parse("15:00:00 -0600") ||
      params[:type] == "lunch"
  end
end