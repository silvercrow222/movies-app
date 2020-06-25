class Era < ApplicationRecord
  has_many :movies, through: :era_movies
  has_many :era_movies
end
