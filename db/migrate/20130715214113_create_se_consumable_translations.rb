class CreateSeConsumableTranslations < ActiveRecord::Migration
  def self.up
   	SeConsumable.create_translation_table! :name => :string
  end

  def self.down
    SeConsumable.drop_translation_table!
  end
end
