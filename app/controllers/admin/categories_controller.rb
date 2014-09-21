module Admin
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
        redirect_to admin_categories_path
      else
        render :new
      end
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      if @category.update_attributes(strong_params)
        redirect_to admin_categories_path
      else
        render :edit
      end
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categories_path
    end

    private

    def strong_params
      params.require(:category).permit(:name)
    end

  end
end