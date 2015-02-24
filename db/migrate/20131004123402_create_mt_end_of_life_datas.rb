class CreateMtEndOfLifeDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_end_of_life_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_family_id
      t.integer :mt_material_id
      t.float :quantity
      t.string :scenario

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_end_of_life_datas
  end
end
