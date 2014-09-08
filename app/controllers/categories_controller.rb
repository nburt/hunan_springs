class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(strong_params)
    if @category.save
      flash[:category_success] = "#{@category.name} was successfully created!"
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:category).permit(:name)
  end

end