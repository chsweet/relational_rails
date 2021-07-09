class VegetableGardensController < ApplicationController
  def index
    @vegetable_gardens = VegetableGarden.all
  end

  def show
    @vegetable_garden = VegetableGarden.find(params[:id])
  end

  def vegetables_index
    @vegetable_garden = VegetableGarden.find(params[:vegetable_garden_id])
    @vegetables = @vegetable_garden.vegetables
  end
end
