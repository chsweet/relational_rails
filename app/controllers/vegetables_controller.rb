class VegetablesController < ApplicationController
  def index
    @vegetables = Vegetable.perennial_vegetable
  end

  def show
    @vegetable = Vegetable.find(params[:id])
  end

  def new
    @garden = Garden.find(params[:id])
  end

  def create
    garden = Garden.find(params[:id])
    vegetable = garden.vegetables.create(vegetable_params)
    redirect_to "/gardens/#{garden.id}/vegetables"
  end

  def edit
    @vegetable = Vegetable.find(params[:id])
  end

  def update
    vegetable = Vegetable.find(params[:id])
    vegetable.update(vegetable_params)
    redirect_to "/vegetables/#{vegetable.id}"
  end

  def destroy
    vegetable = Vegetable.find(params[:id])
    vegetable.destroy
    redirect_to '/vegetables'
  end

private
  def vegetable_params
    params.permit(:name, :perennial, :min_hrs_sun)
  end
end
