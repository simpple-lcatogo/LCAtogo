class CreateBpMaterialDatas < ActiveRecord::Migration
  def self.up
    create_table :bp_material_datas do |t|
      t.references :bp_product
      t.references :bp_material
      t.float :quantity
      t.references :bp_unit
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_material_datas
  end
end
