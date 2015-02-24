class CreateEconomicalFamilies < ActiveRecord::Migration
  def self.up
    create_table :economical_families do |t|
      t.string :name
      t.integer :economical_phase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :economical_families
  end
end
