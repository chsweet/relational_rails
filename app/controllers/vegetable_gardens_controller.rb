class VegetableGardensController < ApplicationController
  def index
    @vegetable_gardens = VegetableGarden.all.order(:created_at)
  end

  def show
    @vegetable_garden = VegetableGarden.find(params[:id])
  end

  def vegetables_index
    @vegetable_garden = VegetableGarden.find(params[:id])
    @vegetables = @vegetable_garden.vegetables
  end

  def new
  end

  def create
    vegetable_garden = VegetableGarden.create(garden_params)
    redirect_to '/vegetable_gardens'
  end

  def edit
    @vegetable_garden = VegetableGarden.find(params[:id])
  end

  def update
    vegetable_garden = VegetableGarden.find(params[:id])
    vegetable_garden.update(garden_params)
    redirect_to "/vegetable_gardens/#{vegetable_garden.id}"
  end

private
  def garden_params
    params.permit(:name, :summer_garden, :winter_garden, :hrs_of_sun)
  end
end
