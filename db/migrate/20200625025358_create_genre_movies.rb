class CreateGenreMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_movies do |t|
      t.references :movie, foreign_key: true
      t.references :genre, foreign_key: true
    end
  end
end
