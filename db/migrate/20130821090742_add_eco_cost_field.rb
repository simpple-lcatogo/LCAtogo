class AddEcoCostField < ActiveRecord::Migration
  def self.up
    add_column :st_material_datas, :eco_cost, :float    
    add_column :st_energy_datas, :eco_cost, :float
    add_column :st_process_datas, :eco_cost, :float    
    add_column :st_packaging_datas, :eco_cost, :float    
    add_column :st_transport_datas, :eco_cost, :float    
    add_column :st_consumption_datas, :eco_cost, :float
    add_column :st_consumable_datas, :eco_cost, :float    
  end

  def self.down
    remove_column :st_material_datas, :eco_cost
    remove_column :st_energy_datas, :eco_cost
    remove_column :st_process_datas, :eco_cost    
    remove_column :st_packaging_datas, :eco_cost
    remove_column :st_transport_datas, :eco_cost    
    remove_column :st_consumption_datas, :eco_cost
    remove_column :st_consumable_datas, :eco_cost    
  end
end
