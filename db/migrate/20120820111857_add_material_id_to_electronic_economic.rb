class AddMaterialIdToElectronicEconomic < ActiveRecord::Migration
  def self.up
    add_column :electronic_economics, :material_id, :integer
  end

  def self.down
    remove_column :electronic_economics, :material_id
  end
end
