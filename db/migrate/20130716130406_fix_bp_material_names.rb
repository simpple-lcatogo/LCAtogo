class FixBpMaterialNames < ActiveRecord::Migration
  def self.up
    bp_material = BpMaterial.find(:first, :conditions => ["name = 'Starch blend type I'"])
    if bp_material
       bp_material.name = "TPS blend type I (for film applications)"
       bp_material.save
       bp_material.bp_material_translations.each do |bp_material_translation|
           bp_material_translation.name = "TPS blend type I (for film applications)"
           bp_material_translation.save           
       end  
    end  
    
    bp_material = BpMaterial.find(:first, :conditions => ["name = 'Starch blend type II'"])
    if bp_material
       bp_material.name = "TPS blend type II (for film applications)"
       bp_material.save
       bp_material.bp_material_translations.each do |bp_material_translation|
           bp_material_translation.name = "TPS blend type II (for film applications)"
           bp_material_translation.save           
       end  
    end  

    bp_material = BpMaterial.find(:first, :conditions => ["name = 'PBS'"])
    if bp_material
       bp_material.name = "Partially bio-based PBS"
       bp_material.save
       bp_material.bp_material_translations.each do |bp_material_translation|
           bp_material_translation.name = "Partially bio-based PBS"
           bp_material_translation.save           
       end  
    end  

    bp_material = BpMaterial.find(:first, :conditions => ["name = 'Partially sugarcane-based PET'"])
    if bp_material
       bp_material.name = "Partially bio-based PET"
       bp_material.save
       bp_material.bp_material_translations.each do |bp_material_translation|
           bp_material_translation.name = "Partially bio-based PET"
           bp_material_translation.save           
       end  
    end  

    bp_material = BpMaterial.find(:first, :conditions => ["name = 'Potato-based fermented starch plastic'"])
    if bp_material
       bp_material.name = "Potato starch-based plastic"
       bp_material.save
       bp_material.bp_material_translations.each do |bp_material_translation|
           bp_material_translation.name = "Potato starch-based plastic"
           bp_material_translation.save           
       end  
    end  

    bp_material = BpMaterial.find(:first, :conditions => ["name = 'Flexible PVC compound'"])
    if bp_material
       bp_material.name = "Flexible PVC"
       bp_material.save
       bp_material.bp_material_translations.each do |bp_material_translation|
           bp_material_translation.name = "Flexible PVC"
           bp_material_translation.save           
       end  
    end  

    bp_material = BpMaterial.find(:first, :conditions => ["name = 'Rigid PVC compound'"])
    if bp_material
       bp_material.name = "Rigid PVC"
       bp_material.save
       bp_material.bp_material_translations.each do |bp_material_translation|
           bp_material_translation.name = "Rigid PVC"
           bp_material_translation.save           
       end  
    end  

    bp_material = BpMaterial.find(:first, :conditions => ["name = 'Mathyl methacrylate'"])
    if bp_material
       bp_material.name = "MBS"
       bp_material.save
       bp_material.bp_material_translations.each do |bp_material_translation|
           bp_material_translation.name = "MBS"
           bp_material_translation.save
       end  
    end  
  end

  def self.down
  end
end
