class CreateStConsumptionDatas < ActiveRecord::Migration
  def self.up
    create_table :st_consumption_datas do |t|
      t.integer :st_product_id
      t.integer :st_energy_type_id
      t.integer :st_energy_source_id
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :st_consumption_datas
  end
end
