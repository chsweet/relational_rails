class DirectorsController < ApplicationController

  def index
    @directors = Director.all.order(:created_at)
  end

  def show
    @director = Director.find(params[:id])
  end

  def create
    Director.create(name: params[:name])
    redirect_to '/directors'
  end

  private
  def director_params
    params.permit(:name)
  end
end
