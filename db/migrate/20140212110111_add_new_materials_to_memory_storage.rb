class AddNewMaterialsToMemoryStorage < ActiveRecord::Migration
  def self.up
    family_memory = Family.find_by_name('Memory') 
    Material.create(:name => 'NAND Flash, 20nm, 32Gb/chip and above', :family_id => family_memory.id, :unit => 'GB')
    
    family_storage = Family.find_by_name('Storage')    
    Material.create(:name => 'NAND Flash, 40nm, max. 16Gb/chip', :family_id => family_storage.id, :unit => 'GB')
    Material.create(:name => 'NAND Flash, 20nm, 32Gb/chip and above', :family_id => family_storage.id, :unit => 'GB')    
  end

  def self.down
  end
end
