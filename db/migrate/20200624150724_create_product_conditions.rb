class CreateProductConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_conditions do |t|
      t.integer :product_condition, null: false
      t.timestamps
    end
  end
end
