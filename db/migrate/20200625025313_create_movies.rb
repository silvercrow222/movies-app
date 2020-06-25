class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :details
      t.float :evaluation
      t.timestamps
    end
  end
end
