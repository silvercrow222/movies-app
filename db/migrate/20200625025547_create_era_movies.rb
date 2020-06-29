class CreateEraMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :era_movies do |t|
      t.references :movie, foreign_key: true
      t.references :era, foreign_key: true
    end
  end
end
