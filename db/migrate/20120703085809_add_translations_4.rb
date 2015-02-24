class AddTranslations4 < ActiveRecord::Migration
  def self.up
    EnergyMode.create_translation_table! :name => :string
    EnergyType.create_translation_table! :name => :string
  end

  def self.down
    EnergyMode.drop_translation_table!
    EnergyType.drop_translation_table!    
  end
end
