class CreateMtEnergyFamilies < ActiveRecord::Migration
  def self.up
    create_table :mt_energy_families do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_energy_families
  end
end
