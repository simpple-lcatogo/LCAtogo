class AddMtMaterialWoodCrate < ActiveRecord::Migration
  def self.up
    MtMaterial.create(:name => 'Wood for transport crate', :unit => 'm<sup>3</sup>', :general => false, :recycling => 398.03, :incineration => 126.99, :landfill => 249.39)    
  end

  def self.down
  end
end
