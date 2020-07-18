class AddColumnProducts < ActiveRecord::Migration[5.2]
  def up
    add_column  :products, :delivery_fee_id, :integer
    add_column  :products, :prefecture_id, :integer
    add_column  :products, :delivery_days_id, :integer
  end
  
end
