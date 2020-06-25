class CreateEnds < ActiveRecord::Migration[6.0]
  def change
    create_table :ends do |t|
      t.string :attribute, null: false
      t.timestamps
    end
  end
end
