class CreateSeUtilityTranslations < ActiveRecord::Migration
  def self.up
    SeUtility.create_translation_table! :name => :string
  end

  def self.down
    SeUtility.drop_translation_table!
  end
end
