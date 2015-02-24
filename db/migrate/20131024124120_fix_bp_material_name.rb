class FixBpMaterialName < ActiveRecord::Migration
  def self.up
    bp_material = BpMaterial.find_by_name("PHB")
    if bp_material
      bp_material.name = 'PHB from sugarcane' 
      bp_material.save 
    end
  end

  def self.down
  end
end
