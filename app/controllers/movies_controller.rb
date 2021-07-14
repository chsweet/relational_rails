class MoviesController < ApplicationController
  def index
    @movies = Movie.true_oscar
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @director = Director.find(params[:director_id])
  end

  def create
    @director = Director.find(params[:director_id])
    @director.movies.create(movie_params)
    redirect_to "/directors/#{@director.id}/movies"
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to "/movies/#{movie.id}"
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to '/movies'
  end

  private
  def movie_params
    params.permit(:title, :oscar, :nominations)
  end
end
