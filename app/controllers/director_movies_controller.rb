class DirectorMoviesController < ApplicationController
  def index
    director = Director.find(params[:director_id])
    @movies = director.movies
  end
end
