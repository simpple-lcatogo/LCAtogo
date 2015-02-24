class CreateSeEnergyTypeTranslations < ActiveRecord::Migration
  def self.up
    SeEnergyType.create_translation_table! :name => :string
  end

  def self.down
    SeEnergyType.drop_translation_table!
  end
end
