class CreateEnergyTypes < ActiveRecord::Migration
  def self.up
    create_table :energy_types do |t|
      t.string :name
      t.integer :family_id
      t.timestamps
    end
  end

  def self.down
    drop_table :energy_types
  end
end
