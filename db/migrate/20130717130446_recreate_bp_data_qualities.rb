class RecreateBpDataQualities < ActiveRecord::Migration
  def self.up
    drop_table :bp_data_qualities  
    create_table :bp_data_qualities do |t|
      t.integer :bp_product_id
      t.string :materials
      t.string :transport
      t.string :processing
      t.string :distribution
      t.string :end_of_life

      t.timestamps
    end
     
  end

  def self.down
    drop_table :bp_data_qualities    
  end
end
