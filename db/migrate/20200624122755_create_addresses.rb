class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.user_id :references, null:false , foreign_key: true
      t.destination_family_name :string , null: false
      t.destination_first_name :string , null: false
      t.destination_family_name_kana :string , null: false
      t.destination_first_name_kana :string , null: false
      t.postal_code :integer , null: false
      t.prefecture :integer , null: false
      t.prefecture :string , null: false 
      t.city :string , null: false
      t.address :string , null: false
      t.building_name :string 
      t.phone_namber :integer , null: false, unque:true
      t.timestamps
    end
  end
end
