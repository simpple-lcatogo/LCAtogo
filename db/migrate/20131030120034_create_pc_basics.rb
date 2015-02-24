class CreatePcBasics < ActiveRecord::Migration
  def self.up
    create_table :pc_basics do |t|
      t.integer :pc_product_id
      t.integer :pc_country_info_id
      t.string :pcb_mark      
      t.string :pcb_type
      t.float :pcb_area
      t.float :pcb_number
      t.float :layers
      t.integer :pc_coating_type_id
      t.string :rohs_compliant
      t.text :comments
      t.string :assessment

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_basics
  end
end
