class AddTypeToBpMaterial < ActiveRecord::Migration
  def self.up
    add_column :bp_materials, :based_type, :string
  end

  def self.down
    remove_column :bp_materials, :based_type
  end
end
