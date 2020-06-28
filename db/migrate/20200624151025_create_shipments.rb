class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :shipment,       null: false
      t.string :area,           null: false
      t.string :charge_payment, null: false
      t.string :days,           null: false
      t.timestamps
    end
  end
end
