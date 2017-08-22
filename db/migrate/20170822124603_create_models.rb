class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :models do |t|
      t.string :name
      t.string :model_slug
      t.references :organization, index: true, foreign_key: true
      t.timestamps
    end
  end
end
