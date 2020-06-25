class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname,       null:false
      t.string :emailadress,    null:false, unique:true, index:true
      t.string :user_password,  null:false
      t.timestamps
    end
  end
end
