class CreateStMaterialDatas < ActiveRecord::Migration
  def self.up
    create_table :st_material_datas do |t|
      t.integer :st_product_id
      t.integer :st_family_id
      t.integer :st_material_id
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :st_material_datas
  end
end
