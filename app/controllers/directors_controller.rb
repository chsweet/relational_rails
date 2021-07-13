class DirectorsController < ApplicationController

  def index
    @directors = Director.all.order(:created_at)
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
  end

  def create
    Director.create(director_params)
    redirect_to '/directors'
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    director = Director.find(params[:id])
    director.update(director_params)
    redirect_to "/directors/#{director.id}"
  end

  private
  def director_params
    params.permit(:name, :oscar, :nominations)
  end
end
