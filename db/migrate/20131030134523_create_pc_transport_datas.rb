class CreatePcTransportDatas < ActiveRecord::Migration
  def self.up
    create_table :pc_transport_datas do |t|
      t.integer :pc_product_id
      t.integer :pc_transport_type_id
      t.float :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_transport_datas
  end
end
