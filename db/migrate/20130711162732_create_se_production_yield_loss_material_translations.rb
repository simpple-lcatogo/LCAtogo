class CreateSeProductionYieldLossMaterialTranslations < ActiveRecord::Migration
  def self.up
	SeProductionYieldLossMaterial.create_translation_table! :name => :string    
  end

  def self.down
    SeProductionYieldLossMaterial.drop_translation_table!
  end
end
