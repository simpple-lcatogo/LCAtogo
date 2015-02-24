class AddFieldsToStProcessData < ActiveRecord::Migration
  def self.up
    add_column :st_process_datas, :user_process_name, :string    
    add_column :st_process_datas, :user_eco_costs, :float    
    add_column :st_process_datas, :user_unit, :string       
  end

  def self.down
    remove_column :st_process_datas, :user_process_name    
    remove_column :st_process_datas, :user_eco_costs    
    remove_column :st_process_datas, :user_unit      
  end
end
