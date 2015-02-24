class CreateComponentDatas < ActiveRecord::Migration
  def self.up
    create_table :component_datas do |t|
      t.integer :data_module_id
      t.integer :family_id
      t.integer :material_id
      t.float :quantity
      t.integer :product_id
      t.string :module_text
      t.float :ratio
      t.float :aspect
      t.float :diagonal          
      t.timestamps
    end
  end

  def self.down
    drop_table :component_datas
  end
end
