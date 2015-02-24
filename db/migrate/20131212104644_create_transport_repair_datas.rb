class CreateTransportRepairDatas < ActiveRecord::Migration
  def self.up
    create_table :transport_repair_datas do |t|
      t.integer :product_id
      t.float :distance
      t.float :amount
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :transport_repair_datas
  end
end
