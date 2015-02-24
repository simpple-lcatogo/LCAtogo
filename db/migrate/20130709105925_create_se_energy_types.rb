class CreateSeEnergyTypes < ActiveRecord::Migration
  def self.up
    create_table :se_energy_types do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :se_energy_types
  end
end
