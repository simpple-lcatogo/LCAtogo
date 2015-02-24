class AddPhElectricComponentsDefaults < ActiveRecord::Migration
  def self.up
    change_column_default(:ph_electric_components, :inverter_size_1, 0.0)
    change_column_default(:ph_electric_components, :quantity_1, 0.0)
    change_column_default(:ph_electric_components, :lifetime_1, 0.0)
    change_column_default(:ph_electric_components, :inverter_size_2, 0.0)
    change_column_default(:ph_electric_components, :quantity_2, 0.0)
    change_column_default(:ph_electric_components, :lifetime_2, 0.0)    
  end

  def self.down
  end
end
