class VegetableGardensController < ApplicationController
  def index
    @vegetable_gardens = VegetableGarden.all.order(:created_at)
  end

  def show
    @vegetable_garden = VegetableGarden.find(params[:id])
  end

  def vegetables_index
    show
    @vegetables = @vegetable_garden.vegetables
  end
end
