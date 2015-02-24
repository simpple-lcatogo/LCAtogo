class CreateBpEconomicalFamilies < ActiveRecord::Migration
  def self.up
    create_table :bp_economical_families do |t|
      t.string :name
      t.integer :bp_economical_phase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_economical_families
  end
end
