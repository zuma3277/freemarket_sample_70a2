class CreateFavoriteProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_products do |t|
      t.references :user_id,       null:false, foreign_key:true
      t.references :product_id,    null:false, foreign_key:true
      t.timestamps
    end
  end  
end
