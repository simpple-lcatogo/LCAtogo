class AddFieldsToMtUse < ActiveRecord::Migration
  def self.up
    add_column :mt_uses, :description_2, :string     
    add_column :mt_uses, :description_3, :string
    add_column :mt_uses, :shifts_day_2, :string    
    add_column :mt_uses, :shifts_day_3, :string    
    add_column :mt_uses, :working_days_2, :string    
    add_column :mt_uses, :working_days_3, :string    
    add_column :mt_uses, :parts_produced_2, :string    
    add_column :mt_uses, :parts_produced_3, :string           
  end

  def self.down
    remove_column :mt_uses, :description_2
    remove_column :mt_uses, :description_3
    remove_column :mt_uses, :shifts_day_2
    remove_column :mt_uses, :shifts_day_3
    remove_column :mt_uses, :working_days_2
    remove_column :mt_uses, :working_days_3
    remove_column :mt_uses, :parts_produced_2
    remove_column :mt_uses, :parts_produced_3
  end
end
