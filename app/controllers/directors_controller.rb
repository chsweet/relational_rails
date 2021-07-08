class DirectorsController < ApplicationController

  def index
    # binding.pry
    @directors = Director.all
  end

  def show
  end
end
