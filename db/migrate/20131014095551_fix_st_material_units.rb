class FixStMaterialUnits < ActiveRecord::Migration
  def self.up
    st_materials = StMaterial.find_all_by_unit('part')
    st_materials.each do |st_material|
      st_material.unit = 'piece(s)'
      st_material.save
    end
  end

  def self.down
  end
end
