class AddTypeToBpManufacturingProcess < ActiveRecord::Migration
  def self.up
    add_column :bp_manufacturing_processes, :process_type, :string
  end

  def self.down
    remove_column :bp_manufacturing_processes, :process_type
  end
end
