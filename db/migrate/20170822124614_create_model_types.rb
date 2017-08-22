class CreateModelTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :model_types do |t|
      t.string :name
      t.string :model_type_slug
      t.string :model_type_code
      t.integer :base_price
      t.references :model, index: true, foreign_key: true
      t.timestamps
    end
  end
end
