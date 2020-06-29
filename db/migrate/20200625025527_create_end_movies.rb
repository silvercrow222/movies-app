class CreateEndMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :end_movies do |t|
      t.references :movie, foreign_key: true
      t.references :end, foreign_key: true
    end
  end
end
