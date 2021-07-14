class GardensController < ApplicationController
  def index
    @gardens = Garden.all.order(:created_at)
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def vegetables_index
    @garden = Garden.find(params[:id])
    if params[:sort] == 'alphabatize'
      @vegetables = @garden.vegetables.alphabatize
    elsif params[:filter] == 'number'
      @vegetables = @garden.vegetables.order(:min_hrs_sun)
    else
      @vegetables = @garden.vegetables
    end
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
    garden.update(garden_params)
    redirect_to "/gardens/#{garden.id}"
  end

  def destroy
    garden = Garden.find(params[:id])
    garden.destroy
    redirect_to "/gardens"
  end

private
  def garden_params
    params.permit(:name, :weeded, :hrs_of_sun)
  end
end
