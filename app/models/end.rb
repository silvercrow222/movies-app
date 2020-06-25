class End < ApplicationRecord
  has_many :movies, through: :end_movies
  has_many :end_movies
end
