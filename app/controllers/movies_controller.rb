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
      recommended_movies if user_signed_in?
    end
  end

  def new
    @movie = Movie.new
    @genres, @ends, @eras = Genre.all, End.all, Era.all
  end

  def create
    redirect_to new_movie_path if Movie.create(movie_params)
  end

  def edit
    @movie = Movie.find(params[:id])
    @genres, @ends, @eras = Genre.all, End.all, Era.all
    if @evaluation = Evaluation.where(user_id: current_user.id).find_by(movie_id: params[:id])
    else
      @evaluation = @movie.evaluations.new
    end
  end

  def update
    movie = Movie.find(params[:id])
    if evaluation = movie.evaluations.find_by(user_id: current_user.id)
      evaluation.delete
    end
    if current_user.id == 1 && movie.update(movie_params)
      redirect_to edit_movie_path
    elsif movie.update(movie_params)
      redirect_to root_path 
    else
      render :edit
    end
  end

  def search
  end

  def finely
    @movies = Movie.all
    if params[:genre_ids]
      movies_genre, movies_era, movies = [], [], []
      attributes = ["genre", "era"]
      attributes.each do |string|
        eval(
        "params[:#{string}_ids].each do |id|
          nums = #{string.capitalize}Movie.all.includes(:#{string}, :movie)
          nums.where(#{string}_id: id.to_i).each do |num|
            movies_#{string}.push(@movies.find(num.movie_id))
          end
        end")
      end
      @movies.each do |movie|
        movies.push(movie) if movies_genre.include?(movie) && movies_era.include?(movie)
      end
      @movies = movies
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :details, evaluations_attributes: [:value, :user_id],
    genre_movies_attributes: [:genre_id], end_movies_attributes: [:end_id], era_movies_attributes: [:era_id]) 
  end

  def redirect
    redirect_to root_path unless current_user.id == 1
  end

  def recommended_movies
    @movies.each do |movie|
      movie.evaluations.where(user_id: current_user.id).each do |evaluation|
        eval(
        "@movie#{movie.id}_eva = evaluation.value")
      end
    end

    Genre.all.length.times do |n|
      genre_point, i = 3, 1
      Genre.find(n + 1).genre_movies.each do |middle|
        if eval("@movie#{middle.movie_id}_eva") != nil
          genre_point += eval("@movie#{middle.movie_id}_eva")
          i += 1
        end
      end
      genre_point /= i
      Genre.find(n + 1).update(point_genre: genre_point)
    end
    End.all.length.times do |n|
      end_point, i = 3, 1
      End.find(n + 1).end_movies.each do |middle|
        if eval("@movie#{middle.movie_id}_eva") != nil
          end_point += eval("@movie#{middle.movie_id}_eva")
          i += 1
        end
      end
      end_point /= i
      End.find(n + 1).update(point_end: end_point)
    end
    Era.all.length.times do |n|
      era_point, i = 3, 1
      Era.find(n + 1).era_movies.each do |middle|
        if eval("@movie#{middle.movie_id}_eva") != nil
          era_point += eval("@movie#{middle.movie_id}_eva")
          i += 1
        end
      end
      era_point /= i
      Era.find(n + 1).update(point_era: era_point)
    end

    @movies.each do |movie|
      temp_point, i = 3, 1
      attributes = ["genre", "end", "era"]
      attributes.each do |string|
        eval(
        "movie.#{string}_movies.each do |middle|
          temp_point += middle.#{string}.point_#{string}
          i += 1
        end")
      end
      temp_point /= i
      movie.update(point_temp: temp_point)
    end
    @movies = @movies.order(point_temp: :desc)
  end
end
