class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.user_id :references, null:false, foreign_key:true
      t.product_id :references, null:false, foreign_key:true
      t.comment :text, null:false
      t.timestamps
    end
  end
end
