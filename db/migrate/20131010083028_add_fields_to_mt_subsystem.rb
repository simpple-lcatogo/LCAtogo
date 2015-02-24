class AddFieldsToMtSubsystem < ActiveRecord::Migration
  def self.up
    add_column :mt_subsystems, :processing, :float    
    add_column :mt_subsystems, :ready, :float
    add_column :mt_subsystems, :standby, :float    
  end

  def self.down
    remove_column :mt_subsystems, :processing
    remove_column :mt_subsystems, :ready
    remove_column :mt_subsystems, :standby   
  end
end
