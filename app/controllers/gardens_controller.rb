class GardensController < ApplicationController
  def index
    @gardens = Garden.all.order(:created_at)
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def vegetables_index
    @garden = Garden.find(params[:id])
    @vegetables = @garden.vegetables
  end

  def new
  end

  def create
    garden = Garden.create(garden_params)
    redirect_to '/gardens'
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    garden = Garden.find(params[:id])
    vgarden.update(garden_params)
    redirect_to "/gardens/#{garden.id}"
  end

  def destroy
    garden = Garden.find(params[:id])
    garden.destroy
    redirect_to "/gardens"
  end

private
  def garden_params
    params.permit(:name, :summer_garden, :winter_garden, :hrs_of_sun)
  end
end
