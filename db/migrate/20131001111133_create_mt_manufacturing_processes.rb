class CreateMtManufacturingProcesses < ActiveRecord::Migration
  def self.up
    create_table :mt_manufacturing_processes do |t|
      t.string :name
      t.string :unit
      
      t.timestamps
    end
  end

  def self.down
    drop_table :mt_manufacturing_processes
  end
end
