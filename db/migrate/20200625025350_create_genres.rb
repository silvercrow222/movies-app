class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :attribute_genre, null: false
      t.float :point_genre
    end
  end
end
