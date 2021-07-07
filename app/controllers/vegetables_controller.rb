class VegetablesController < ApplicationController
  def index
    @vegetables = Vegetable.all
  end
end
