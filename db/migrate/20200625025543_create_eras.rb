class CreateEras < ActiveRecord::Migration[6.0]
  def change
    create_table :eras do |t|
      t.string :attribute, null: false
      t.timestamps
    end
  end
end
