class AddTranslations1 < ActiveRecord::Migration
  def self.up
    DataModule.create_translation_table! :name => :string
    Family.create_translation_table! :name => :string
    Material.create_translation_table! :name => :string
  end

  def self.down
    DataModule.drop_translation_table!
    Family.drop_translation_table!
    Material.drop_translation_table!
  end
end
