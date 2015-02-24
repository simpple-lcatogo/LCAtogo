class CreateBpManufacturingProcessesBpMaterials < ActiveRecord::Migration
  def self.up
  	create_table :bp_manufacturing_processes_bp_materials, :id => false do |t|
  	  t.references :bp_manufacturing_process
  	  t.references :bp_material
  	end	
  end

  def self.down
  	drop_table :bp_manufacturing_processes_bp_materials
  end
end
