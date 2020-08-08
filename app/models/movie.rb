class Movie < ApplicationRecord
  has_many :genres, through: :genre_movies
  has_many :genre_movies
  has_many :ends, through: :end_movies
  has_many :end_movies
  has_many :eras, through: :era_movies
  has_many :era_movies
  has_many :evaluations

  accepts_nested_attributes_for :evaluations
  accepts_nested_attributes_for :genre_movies
  accepts_nested_attributes_for :end_movies
  accepts_nested_attributes_for :era_movies
end
