class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @director = Director.find(params[:director_id])
  end

  def create
    @director = Director.find(params[:director_id])
    movie = @director.movies.create(movie_params)
    redirect_to "/directors/#{@director.id}/movies"
  end

  private
  def movie_params
    params.permit(:title, :oscar, :nominations)
  end
end
