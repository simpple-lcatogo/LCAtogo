class CreateBpEndOfLifeDefaultScenarios < ActiveRecord::Migration
  def self.up
    create_table :bp_end_of_life_default_scenarios do |t|
      t.string :name
      t.float :landfill
      t.float :incineration
      t.float :composting
      t.float :recycling
      t.boolean :custom_scenario

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_end_of_life_default_scenarios
  end
end
