class MoviesController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
    end
    if @genre
      @movies = @genre.genre_movies.all 
    else
      @moviesAll = Movie.all
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
    @movieAll = Movie.all
    if params[:genre_ids]
      @movies1 = []
      Movie.all.each do |movie|
        strings = movie.genre_movies.all
        strings.each do |str|
          if params[:genre_ids].include?("#{str.genre.id}")
            @movies1 += strings
          end
        end
      end
    end
    if params[:end_ids]
      @movies2 = []
      Movie.all.each do |movie|
        strings = movie.end_movies.all
        strings.each do |str|
          if params[:end_ids].include?("#{str.end.id}")
            @movies2 += strings
          end
        end
      end
    end
    if params[:era_ids]
      @movies3 = []
      Movie.all.each do |movie|
        strings = movie.era_movies.all
        strings.each do |str|
          if params[:era_ids].include?("#{str.era.id}")
            @movies3 += strings
          end
        end
      end
    end

    if params[:genre_ids]
      @movie_ids1 = []
      @movies1.each do |movie1|
        @movie_ids1.push("#{movie1.movie_id}")
      end
      @movie_ids2 = []
      @movies2.each do |movie2|
        @movie_ids2.push("#{movie2.movie_id}")
      end
      @movie_ids3 = []
      @movies3.each do |movie3|
        @movie_ids3.push("#{movie3.movie_id}")
      end

      movies = []
      @movies = []
      @movie_ids1.each do |id|
        if @movie_ids2.include?("#{id}")
          movies.push("#{id}")
        end
      end
      movies.each do |id|
        if @movie_ids3.include?("#{id}")
          @movies.push("#{id}")
        end
      end

      @movies_name = []
      Movie.all.each do |movie|
        if @movies.include?("#{movie.id}")
          @movies_name.push("#{movie.name}")
        end
      end
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :details, :evaluation)
  end
  def tag_points
  end
end
