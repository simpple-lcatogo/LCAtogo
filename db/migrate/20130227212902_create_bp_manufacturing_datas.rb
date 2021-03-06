class CreateBpManufacturingDatas < ActiveRecord::Migration
  def self.up
    create_table :bp_manufacturing_datas do |t|
      t.references :bp_product
      t.references :bp_manufacturing_process
      t.references :bp_material
      t.float :quantity
      t.references :bp_unit
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_manufacturing_datas
  end
end
