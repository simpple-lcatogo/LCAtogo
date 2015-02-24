class CreateBpCompoundFamilyTranslations < ActiveRecord::Migration
  def self.up
   BpCompoundFamily.create_translation_table! :name => :string
  end

  def self.down
    BpCompoundFamily.drop_translation_table!
  end
end
