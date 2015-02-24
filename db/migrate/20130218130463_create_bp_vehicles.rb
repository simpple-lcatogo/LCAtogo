class CreateBpVehicles < ActiveRecord::Migration
  def self.up
    create_table :bp_vehicles do |t|
      t.string :name
      t.references :bp_mode
      t.timestamps
    end
  end

  def self.down
    drop_table :bp_vehicles
  end
end
