class CreateMtUseAdditionalEnergyDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_use_additional_energy_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_family_id
      t.integer :mt_material_id
      t.float :processing
      t.float :ready
      t.float :standby

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_use_additional_energy_datas
  end
end
