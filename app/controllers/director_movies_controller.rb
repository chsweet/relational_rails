class DirectorMoviesController < ApplicationController
  def index
    @director = Director.find(params[:director_id])
    if params[:sort] == 'Alphabetize'
      @movies = @director.movies.alphabetize
    elsif params[:nomination_count]
      @movies = @director.movies.where("nominations > ?", params[:nomination_count])
    else
      @movies = @director.movies
    end
  end
end
