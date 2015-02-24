class AddFieldsToManufacturingData < ActiveRecord::Migration
  def self.up
    add_column :manufacturing_datas, :component_age, :float  
    add_column :manufacturing_datas, :component_total_lifetime, :float    
    add_column :manufacturing_datas, :overhead_cutoffs, :float
    add_column :manufacturing_datas, :overhead_cutoffs_stamped, :float    
    add_column :manufacturing_datas, :overhead_milled, :float
    add_column :manufacturing_datas, :material_user_name, :string    
    add_column :manufacturing_datas, :user_quantity, :float    
    add_column :manufacturing_datas, :user_global_warming, :float
    add_column :manufacturing_datas, :overhead_miscellaneous, :float    
  end

  def self.down
    remove_column :manufacturing_datas, :component_age    
    remove_column :manufacturing_datas, :component_total_lifetime
    remove_column :manufacturing_datas, :overhead_cutoffs    
    remove_column :manufacturing_datas, :overhead_cutoffs_stamped
    remove_column :manufacturing_datas, :overhead_milled    
    remove_column :manufacturing_datas, :material_user_name
    remove_column :manufacturing_datas, :user_quantity    
    remove_column :manufacturing_datas, :user_global_warming
    remove_column :manufacturing_datas, :overhead_miscellaneous
  end
end
