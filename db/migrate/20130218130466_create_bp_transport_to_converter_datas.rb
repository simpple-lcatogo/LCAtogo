class CreateBpTransportToConverterDatas < ActiveRecord::Migration
  def self.up
    create_table :bp_transport_to_converter_datas do |t|
      t.references :bp_product
      t.references :bp_mode
      t.references :bp_vehicle
      t.float :distance
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_transport_to_converter_datas
  end
end
