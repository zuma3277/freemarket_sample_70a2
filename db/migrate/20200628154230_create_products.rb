class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user,              null: false, foreign_key: true
      t.string     :name,              null: false
      t.integer    :price,             null: false
      t.references :category,          null: false, foreign_key: true
      t.integer :product_condition_id, null: false
      t.integer :size_id,              null: false
      t.integer :dealing_status,    null: false, default: 0
      t.integer :delivery_fee_id,      null: false
      t.integer :prefecture_id,        null: false
      t.integer :delivery_days_id,     null: false
      t.integer    :buyer_id
      t.text       :product_introduction
      t.string     :brand
      t.string     :image,              null: false
      t.timestamps
    end
  end
end
