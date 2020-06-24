class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.nickname :string,       null:false
      t.emailadress :string,    null:false, unique:true, index:true
      t.user_password :string,  null:false
      t.timestamps
    end
  end
end
