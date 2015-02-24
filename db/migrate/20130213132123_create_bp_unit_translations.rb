class CreateBpUnitTranslations < ActiveRecord::Migration
  def self.up
    BpUnit.create_translation_table! :name => :string
  end

  def self.down
    BpUnit.drop_translation_table!
  end
end
