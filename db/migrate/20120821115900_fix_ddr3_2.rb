class FixDdr32 < ActiveRecord::Migration
  def self.up
    family_memory = Family.find(:all, :conditions => ["name = 'Memory'"]).first
    family_memory.materials.each do |material|
      material.unit = "unit(s)"
      material.material_translations.each do |material_translation|
        material_translation.unit = "unit(s)"
        material_translation.save
      end
      material.save
    end    
  end

  def self.down
  end
end
