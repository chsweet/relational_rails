class VegetablesController < ApplicationController
  def index
    @vegetables = Vegetable.all
  end

  def show
    @vegetable = Vegetable.find(params[:id])
  end

  def new
    @vegetable_garden = VegetableGarden.find(params[:id])
  end

  def create
    vegetable_garden = VegetableGarden.find(params[:id])
    vegetable = vegetable_garden.vegetables.create(vegetable_params)
    redirect_to "/vegetable_gardens/#{vegetable_garden.id}/vegetables"
  end

  def edit
    @vegetable = Vegetable.find(params[:id])
  end

  def update
    vegetable = Vegetable.find(params[:id])
    vegetable.update(vegetable_params)
    redirect_to "/vegetables/#{vegetable.id}"
  end

private
  def vegetable_params
    params.permit(:name, :summer_harvest, :winter_harvest, :min_hrs_sun)
  end
end
