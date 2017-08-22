class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :public_name
      t.string :type
      t.string :pricing_policy
      t.timestamps
    end
  end
end
