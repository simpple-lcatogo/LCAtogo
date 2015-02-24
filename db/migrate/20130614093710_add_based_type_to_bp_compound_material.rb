class AddBasedTypeToBpCompoundMaterial < ActiveRecord::Migration
  def self.up
    add_column :bp_compound_materials, :based_type, :string
    
    master_bach_1 = BpCompoundMaterial.find_by_name("Polylactic acid, corn-based")
    master_bach_1.based_type = "bio"
    master_bach_1.save
    
    master_bach_2 = BpCompoundMaterial.find_by_name("Polylactic acid, corn-based")
    master_bach_2.based_type = "bio"
    master_bach_2.save
    
    master_bach_3 = BpCompoundMaterial.find_by_name("Polylactic acid, sugarcane-based")
    master_bach_3.based_type = "bio"
    master_bach_3.save
    
    master_bach_4 = BpCompoundMaterial.find_by_name("Starch blend type I")
    master_bach_4.based_type = "bio"
    master_bach_4.save
    
    master_bach_5 = BpCompoundMaterial.find_by_name("Starch blend type II")
    master_bach_5.based_type = "bio"
    master_bach_5.save
    
    master_bach_6 = BpCompoundMaterial.find_by_name("Potato-based fermented starch plastic")
    master_bach_6.based_type = "bio"
    master_bach_6.save
    
    master_bach_7 = BpCompoundMaterial.find_by_name("Sugarcane-based HDPE")
    master_bach_7.based_type = "bio"
    master_bach_7.save
    
    master_bach_8 = BpCompoundMaterial.find_by_name("Sugarcane-based LDPE")
    master_bach_8.based_type = "bio"
    master_bach_8.save
    
    master_bach_9 = BpCompoundMaterial.find_by_name("Bio-basedPBS")
    master_bach_9.based_type = "bio"
    master_bach_9.save
    
    master_bach_10 = BpCompoundMaterial.find_by_name("Partially sugarcane-based PET")
    master_bach_1.based_type = "bio"
    master_bach_1.save

    master_bach_11 = BpCompoundMaterial.find_by_name("PP")
    master_bach_11.based_type = "oil"
    master_bach_11.save
    
    master_bach_12 = BpCompoundMaterial.find_by_name("LDPE")
    master_bach_12.based_type = "oil"
    master_bach_12.save
    
    master_bach_13 = BpCompoundMaterial.find_by_name("HDPE")
    master_bach_13.based_type = "oil"
    master_bach_13.save
    
    master_bach_14 = BpCompoundMaterial.find_by_name("LLDPE")
    master_bach_14.based_type = "oil"
    master_bach_14.save
    
    master_bach_15 = BpCompoundMaterial.find_by_name("Rigid PVC compound")
    master_bach_15.based_type = "oil"
    master_bach_15.save
    
    master_bach_16 = BpCompoundMaterial.find_by_name("Flexible PVC compound")
    master_bach_16.based_type = "oil"
    master_bach_16.save
    
    master_bach_17 = BpCompoundMaterial.find_by_name("PET")
    master_bach_17.based_type = "oil"
    master_bach_17.save
    


  end

  def self.down
    remove_column :bp_compound_materials, :based_type
  end
end
