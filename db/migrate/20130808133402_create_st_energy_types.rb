class CreateStEnergyTypes < ActiveRecord::Migration
  def self.up
    create_table :st_energy_types do |t|
      t.string :name
      t.string :unit
      t.timestamps
    end
    StEnergyType.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_energy_types
    StEnergyType.drop_translation_table!
  end
end
