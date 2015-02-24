class AddNewStFamily < ActiveRecord::Migration
  def self.up
    st_family_conductive_yarns = StFamily.create(:name => "Conductive yarns")
    StMaterial.create(:name => "Polyester yarn with carbon (Anti-Static)", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)    
    StMaterial.create(:name => "Bamboo Yarn with Silver", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
    StMaterial.create(:name => "Cotton yarn blended with Stainless steel", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
    StMaterial.create(:name => "Polyamide Nylon Yarn with Stainless steel thread", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
    StMaterial.create(:name => "Polyester yarn blended with Stainless steel", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
    StMaterial.create(:name => "Stainless Steel Fiber Sewing Thread", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
    StMaterial.create(:name => "Cotton/polyester blended yarn with Stainless steel", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)    
    
    st_family_fabric = StFamily.create(:name => "Conductive fabric")
    StMaterial.create(:name => "Nylon Mesh Copper & Nickel coated 20g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Polyester Fabric Copper & tin coated", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "polyester taffeta Copper coated 80g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Nylon Copper, Nickel coated 90g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Polyester Copper, Nickel coated 90g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Nylon netting Silver coated 35g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Spandex Silver coated 110g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Bamboo Fabric with Silver thread (30%) 190g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Cotton fabric with Silver thread (5%)", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Polyester/Cotton fabric with Silver thread (5%)", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Nylon fabric with Silver thread (55%) 100g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Polyester fabric with Silver thread (55%) 100g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Knitted jersey fabric with Silver thread 100/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Cotton curtain fabric with Stainless steel thread (20%) 70g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
    StMaterial.create(:name => "Cotton fabric with Stainless steel thread (30%) 180g/m<sup>2</sup>", :unit => "kg", :st_family_id => st_family_fabric.id)    
  end

  def self.down
  end
end
