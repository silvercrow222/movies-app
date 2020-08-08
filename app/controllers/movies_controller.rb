class MoviesController < ApplicationController
  before_action :redirect, only: [:new, :create]

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      movies, @movies = @genre.genre_movies.all, []
      movies.each do |movie|
        @movies.push(movie.movie)
      end
    else
      @movies = Movie.all
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    redirect_to new_movies_path if Movie.create(movie_params)
  end

  def edit
    @movie = Movie.find(params[:id])
    if @evaluation = Evaluation.find_by(user_id: current_user.id)
    else
      @evaluation = @movie.evaluations.new
    end
  end

  def update
    movie = Movie.find(params[:id])
    if evaluation = movie.evaluations.find_by(user_id: current_user.id)
      evaluation.delete
    end
    redirect_to root_path if movie.update(movie_params)
  end

  def search
  end

  def finely
    @movies = Movie.all
    if params[:genre_ids]
      movies_genre, movies_end, movies_era, movies = [], [], [], []
      attributes = ["genre", "end", "era"]
      attributes.each do |string|
        eval(
        "params[:#{string}_ids].each do |id|
          #{string.capitalize}Movie.all.each do |middle|
            if middle.#{string}_id == id.to_i
              movies_#{string}.push(@movies.find(middle.movie_id))
            end
          end
        end")
      end
      @movies.each do |movie|
        movies.push(movie) if movies_genre.include?(movie) && movies_end.include?(movie) && movies_era.include?(movie)
      end
      @movies = movies
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :details, evaluations_attributes: [:value, :user_id])
  end

  def redirect
    redirect_to root_path unless current_user.id == 1
  end
end
