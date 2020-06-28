class CreateProductImgs < ActiveRecord::Migration[5.2]
  def change
    create_table :product_imgs do |t|
      t.references :product,  null: false, foreign_key: true
      t.string :image,        null: false
      t.timestamps
    end
  end
end
