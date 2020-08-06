class MoviesController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      movies = @genre.genre_movies.all
      @movies = []
      movies.each do |movie|
        @movies.push(movie.movie)
      end
    else
      @movies = Movie.all
    end

    Genre.all.length.times do |n|
      genre_point = 0
      i = 0
      genres = Genre.find(n + 1).genre_movies
      genres.each do |genre|
        if genre.movie.evaluation != nil
          genre_point += genre.movie.evaluation
          i += 1
        end
      end
      if genre_point != 0
        genre_point /= i
      end
      instance_variable_set("@genre#{n + 1}_point", genre_point)
      Genre.find(n + 1).update(point_genre: genre_point)
    end
    End.all.length.times do |n|
      end_point = 0
      i = 0
    ends = End.find(n + 1).end_movies
    ends.each do |end_|
        if end_.movie.evaluation != nil
          end_point += end_.movie.evaluation
          i += 1
        end
      end
      if end_point != 0
        end_point /= i
      end
      instance_variable_set("@end#{n + 1}_point", end_point)
      End.find(n + 1).update(point_end: end_point)
    end
    Era.all.length.times do |n|
      era_point = 0
      i = 0
      eras = Era.find(n + 1).era_movies
      eras.each do |era|
        if era.movie.evaluation != nil
          era_point += era.movie.evaluation
          i += 1
        end
      end
      if era_point != 0
        era_point /= i
      end
      instance_variable_set("@era#{n + 1}_point", era_point)
      Era.find(n + 1).update(point_era: era_point)
    end

    if @moviesAll
      @movies_all = []
      Genre.all.order(point_genre: "DESC").each do |genre|
        genre.genre_movies.each do |table|
          @movies_all.push(table.movie)
        end
      end
    end
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
    params.require(:movie).permit(:name, :details, :evaluation)
  end
end
