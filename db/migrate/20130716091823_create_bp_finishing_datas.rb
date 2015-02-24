class CreateBpFinishingDatas < ActiveRecord::Migration
  def self.up
    create_table :bp_finishing_datas do |t|
      t.integer :bp_product_id
      t.integer :bp_manufacturing_process_id  
      t.float :quantity            
      t.integer :bp_unit_id            
      t.text :comment
      t.integer :bp_material_id
      t.integer :bp_country_info_id
      t.timestamps
    end    
  end

  def self.down
     drop_table :bp_finishing_datas
  end
end


