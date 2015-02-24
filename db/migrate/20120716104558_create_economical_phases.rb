class CreateEconomicalPhases < ActiveRecord::Migration
  def self.up
    create_table :economical_phases do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :economical_phases
  end
end
