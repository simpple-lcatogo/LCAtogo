class AddTranslations2 < ActiveRecord::Migration
  def self.up
    DataProcess.create_translation_table! :name => :string
  end

  def self.down
    DataProcess.drop_translation_table!
  end
end
