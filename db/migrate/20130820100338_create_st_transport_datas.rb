class CreateStTransportDatas < ActiveRecord::Migration
  def self.up
    create_table :st_transport_datas do |t|
      t.integer :st_product_id
      t.integer :st_family_transport_id
      t.integer :st_transport_id
      t.float :distance
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :st_transport_datas
  end
end
