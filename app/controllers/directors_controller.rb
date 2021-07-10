class DirectorsController < ApplicationController

  def index
    @directors = Director.all.order(:created_at)
  end

  def show
    @director = Director.find(params[:id])
  end
end
