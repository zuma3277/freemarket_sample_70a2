class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, null:false , foreign_key: true
      t.string :destination_family_name , null: false
      t.string :destination_first_name , null: false
      t.string :destination_family_name_kana , null: false
      t.string :destination_first_name_kana , null: false
      t.integer :postal_code , null: false
      t.integer :prefecture , null: false
      t.string :prefecture , null: false 
      t.string :city , null: false
      t.string :address , null: false
      t.string :building_name
      t.integer :phone_namber , null: false, unque:true
      t.timestamps
    end
  end
end
