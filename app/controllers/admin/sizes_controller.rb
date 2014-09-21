module Admin
  class SizesController < ApplicationController

    def index
      @sizes = Size.all
    end

    def new
      @size = Size.new
    end

    def create
      @size = Size.new(strong_params)
      if @size.save
        flash[:size_success] = "Size: #{@size.name} was successfully created!"
        redirect_to admin_sizes_path
      else
        render :new
      end
    end

    def edit
      @size = Size.find(params[:id])
    end

    def update
      @size = Size.find(params[:id])
      if @size.update_attributes(strong_params)
        redirect_to admin_sizes_path
      else
        render :edit
      end
    end

    def destroy
      size = Size.find(params[:id])
      size.destroy
      redirect_to admin_sizes_path
    end

    private

    def strong_params
      params.require(:size).permit(:name)
    end

  end
end