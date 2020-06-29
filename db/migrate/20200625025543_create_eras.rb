class CreateEras < ActiveRecord::Migration[6.0]
  def change
    create_table :eras do |t|
      t.string :attribute_era, null: false
      t.float :point_era
    end
  end
end
