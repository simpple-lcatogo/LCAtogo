class CreateBpEconomicalPhases < ActiveRecord::Migration
  def self.up
    create_table :bp_economical_phases do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_economical_phases
  end
end
