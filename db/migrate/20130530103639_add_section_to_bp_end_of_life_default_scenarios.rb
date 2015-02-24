class AddSectionToBpEndOfLifeDefaultScenarios < ActiveRecord::Migration
  def self.up
    add_column :bp_end_of_life_default_scenarios, :section, :integer
  end

  def self.down
    remove_column :bp_end_of_life_default_scenarios, :section
  end
end
