class CreateSeEnergyUses < ActiveRecord::Migration
  def self.up
    create_table :se_energy_uses do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :se_energy_uses
  end
end
