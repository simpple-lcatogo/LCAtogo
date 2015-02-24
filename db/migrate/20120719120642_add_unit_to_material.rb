class AddUnitToMaterial < ActiveRecord::Migration
  def self.up
    add_column :materials, :unit, :string  
    add_column :material_translations, :unit, :string
  end

  def self.down
    remove_column :materials, :unit
    remove_column :material_translations, :unit
  end
end
