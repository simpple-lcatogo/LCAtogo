class CreateMtEnergyDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_energy_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_energy_family_id
      t.integer :mt_energy_process_id
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_energy_datas
  end
end
