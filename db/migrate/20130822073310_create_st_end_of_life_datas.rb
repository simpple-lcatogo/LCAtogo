class CreateStEndOfLifeDatas < ActiveRecord::Migration
  def self.up
    create_table :st_end_of_life_datas do |t|
      t.integer :st_product_id
      t.integer :st_material_data_id
      t.integer :st_packaging_data_id
      t.integer :st_consumable_data_id
      t.float :quantity_recycling
      t.float :quantity_incineration
      t.float :eco_cost_recycling
      t.float :eco_cost_incineration

      t.timestamps
    end
  end

  def self.down
    drop_table :st_end_of_life_datas
  end
end
