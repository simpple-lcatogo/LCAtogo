class AddTranslations3 < ActiveRecord::Migration
  def self.up
    DataMode.create_translation_table! :name => :string
    Vehicle.create_translation_table! :name => :string
  end

  def self.down
    DataMode.drop_translation_table!
    Vehicle.drop_translation_table!
  end
end
