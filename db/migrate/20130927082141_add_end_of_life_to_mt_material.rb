class AddEndOfLifeToMtMaterial < ActiveRecord::Migration
  def self.up
     add_column :mt_materials, :recycling, :float        
     add_column :mt_materials, :incineration, :float
     add_column :mt_materials, :landfill, :float     
  end

  def self.down
     remove_column :mt_materials, :recycling   
     remove_column :mt_materials, :incineration
     remove_column :mt_materials, :landfill     
  end
end
