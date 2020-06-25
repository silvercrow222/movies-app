class MoviesController < ApplicationController
  def index
  end
  def new
    @movie = Movie.new
  end
  def create
    Movie.create(movie_params)
  end
  def edit
  end
  def update
  end
  def search
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :details)
  end

end
