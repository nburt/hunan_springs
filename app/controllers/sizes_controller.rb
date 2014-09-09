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
      redirect_to sizes_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:size).permit(:name)
  end


end