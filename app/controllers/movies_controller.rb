class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def new
    @movie = Movie.new
  end
  def create
    Movie.create(movie_params)
  end
  def edit
    @movie = Movie.find(params[:id])
  end
  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
  end
  def search
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :details, :evaluation)
  end

end
