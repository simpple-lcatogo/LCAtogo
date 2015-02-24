class CreateBpFinishingProcessUserVariables < ActiveRecord::Migration
  def self.up
    create_table :bp_finishing_process_user_variables do |t|
      t.integer :bp_manufacturing_process_variable_id  
      t.float :value          
      t.integer :bp_finishing_data_id            
      t.timestamps
    end        
  end

  def self.down
     drop_table :bp_finishing_process_user_variables    
  end
end