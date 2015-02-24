class CreateBpModeTranslations < ActiveRecord::Migration
  def self.up
    BpMode.create_translation_table! :name => :string
  end

  def self.down
    BpMode.drop_translation_table!
  end
end
