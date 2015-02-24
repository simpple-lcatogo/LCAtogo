class CreateMaterialDatas < ActiveRecord::Migration
  def self.up
    create_table :material_datas do |t|
      t.integer :data_module_id
      t.integer :family_id
      t.integer :material_id
      t.float :quantity
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :material_datas
  end
end
