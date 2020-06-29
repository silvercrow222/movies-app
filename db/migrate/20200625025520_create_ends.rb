class CreateEnds < ActiveRecord::Migration[6.0]
  def change
    create_table :ends do |t|
      t.string :attribute_end, null: false
      t.float :point_end
    end
  end
end
