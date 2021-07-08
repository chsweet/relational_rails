class VegetableGardensController < ApplicationController
  def index
    @vegetable_gardens = VegetableGarden.all
  end

  def show
    @vegetable_garden = VegetableGarden.find(params[:id])
  end

  def vegetables_index
  end 
end
