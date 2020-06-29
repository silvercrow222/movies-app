class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
  def new
    @genre = Genre.new
  end
  def create
    Genre.create(genre_params)
  end

  private
  def genre_params
    params.require(:genre).permit(:attribute_genre)
  end 
end
