class CreatePhUnits < ActiveRecord::Migration
  def self.up
    create_table :ph_units do |t|
      t.string :name
      t.string :unit_filter
      t.float :conversion_factor
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ph_units
  end
end
