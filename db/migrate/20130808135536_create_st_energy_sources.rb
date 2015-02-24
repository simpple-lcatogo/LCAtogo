class CreateStEnergySources < ActiveRecord::Migration
  def self.up
    create_table :st_energy_sources do |t|
      t.string :name
      t.references :st_energy_type

      t.timestamps
    end
    StEnergySource.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_energy_sources
    StEnergySource.drop_translation_table!
  end
end
