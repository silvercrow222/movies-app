class Movie < ApplicationRecord
  has_many :genres, through: :genre_movies
  has_many :genre_movies
  has_many :ends, through: :end_movies
  has_many :end_movies
  has_many :eras, through: :era_movies
  has_many :era_movies
end
