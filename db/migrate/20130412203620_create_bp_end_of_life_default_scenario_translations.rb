class CreateBpEndOfLifeDefaultScenarioTranslations < ActiveRecord::Migration
  def self.up
    BpEndOfLifeDefaultScenario.create_translation_table! :name => :string
  end

  def self.down
    BpEndOfLifeDefaultScenario.drop_translation_table!
  end
end
