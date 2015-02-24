class CreateSeEnergyUseTranslates < ActiveRecord::Migration
  def self.up
	SeEnergyUse.create_translation_table! :name => :string
  end

  def self.down
  	SeEnergyUse.drop_translation_table!
  end
end
