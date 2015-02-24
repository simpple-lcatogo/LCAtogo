class FixDdr3 < ActiveRecord::Migration
  def self.up
    family_memory = Family.find(:all, :conditions => ["name = 'Memory'"]).first
    family_memory.materials.each do |material|
      material.delete
    end
   material_8 = Material.create(:name => 'DDR3 - 4GB', :family_id => family_memory.id, :unit => 'units')
   MaterialTranslation.create(:material_id => material_8.id, :name => 'DDR3 - 4GB', :unit => 'units', :locale => 'en')
   material_9 = Material.create(:name => 'DDR3 - 8GB', :family_id => family_memory.id, :unit => 'units')
   MaterialTranslation.create(:material_id => material_9.id, :name => 'DDR3 - 8GB', :unit => 'units', :locale => 'en')
    
  end

  def self.down
  end
end
