class CreateBpManufacturingTransportDatas < ActiveRecord::Migration
  def self.up
    create_table :bp_manufacturing_transport_datas do |t|
      t.references :bp_product
      t.references :bp_mode
      t.references :bp_vehicle
      t.float :distance
      t.float :amount
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_manufacturing_transport_datas
  end
end
