class GenresController < ApplicationController
  before_action :redirect

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
  def redirect
    redirect_to root_path unless current_user.id == 1
  end
end
