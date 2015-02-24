class FixData < ActiveRecord::Migration
  def self.up
     data_modules = DataModule.find(:all, :conditions => ["name = 'Electronic Module'"])
     data_modules.each do |data_module|
       data_module_translations = DataModuleTranslation.find(:all, :conditions => ["data_module_id = ?", data_module.id])
       data_module_translations.each do |data_module_translation|
         data_module_translation.delete
       end
       data_module.delete
     end
   
     materials = Material.find(:all, :conditions => ["name = 'all PCB assemblies'"])
     materials.each do |material|
       material_translations = MaterialTranslation.find(:all, :conditions => ["material_id = ?", material.id])
       material_translations.each do |material_translation|
         material_translation.delete
       end
       material.delete
     end
     
     energy_modes = EnergyMode.find(:all, :conditions => ["name = 'Power Sleep'"])
     energy_modes.each do |energy_mode|
       energy_mode_translations = EnergyModeTranslation.find(:all, :conditions => ["energy_mode_id = ?", energy_mode.id])
       energy_mode_translations.each do |energy_mode_translation|
         energy_mode_translation.name = 'Power sleep'
         energy_mode_translation.save
       end
       energy_mode.name = 'Power sleep'
       energy_mode.save
     end

     materials = Material.find(:all, :conditions => ["name = '0 VA'"])
     materials.each do |material|
       material_translations = MaterialTranslation.find(:all, :conditions => ["material_id = ?", material.id])
       material_translations.each do |material_translation|
         material_translation.delete
       end
       material.delete
     end
     
     
     family_batteries = Family.find(:all, :conditions => ["name = 'Battery'"])
     family_battery = family_batteries.first
     material_battery = Material.create(:name => 'Capacity', :family_id => family_battery.id, :unit => 'mAh')
     MaterialTranslation.create(:material_id => material_battery.id, :name => 'Capacity', :unit => 'mAh', :locale => 'en')
     
     
  end

  def self.down
  end
end
