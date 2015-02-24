class AddNewBpCompoundMaterials < ActiveRecord::Migration
  def self.up
     bp_compound_family = BpCompoundFamily.find_by_name("Master-batch")
     if bp_compound_family
       BpCompoundMaterial.create(:name => "PHB", :bp_compound_family_id => bp_compound_family.id, :based_type => "bio")
       BpCompoundMaterial.create(:name => "Partially bio-based PET", :bp_compound_family_id => bp_compound_family.id, :based_type => "bio")       
     end
  end

  def self.down
  end
end
