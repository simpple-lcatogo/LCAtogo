class ChangeStMaterialUnits < ActiveRecord::Migration
  def self.up
    StMaterial.all.each do |st_material|
       if st_material.unit == 'kg'
         st_material.unit = 'g'
         st_material.save
       end      
    end
    StMaterialData.all.each do |st_material_data|
       if st_material_data.st_material && st_material_data.st_material.unit == 'g'
         if st_material_data.eco_cost
           st_material_data.eco_cost = st_material_data.eco_cost / 1000
           st_material_data.save
         end  
       end      
    end   
   
  end

  def self.down
  end
end
