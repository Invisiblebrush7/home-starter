class FurnituresController < ApplicationController
  def index
    @furnitures = Furniture.all
  end

  def show
    @furniture = Furniture.find(params[:id])
  end

  def new
    @furniture = Furniture.new
  end

  def create
    @furniture = Furniture.new(furniture_params)
    if @furniture.save
      redirect_to furniture_path(@furniture)
    else
      render 'new'
    end
  end

  def edit
    @furniture = Furniture.find(params[:id])
  end

  def update
    @furniture = Furniture.find(params[:id])
    @furniture.update(furniture_params)
    redirect_to furniture_path(@furniture)
  end

  def destroy
    @furniture = Furniture.find(params[:id])
    @furniture.destroy
    redirect_to furnitures_path
  end

  private

  def furniture_params
    params.require(:furniture).permit(:name, :description, :dimensions, :price, :condition, :photo)
  end

end
