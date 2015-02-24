class CreateSeComponentTranslates < ActiveRecord::Migration
  def self.up
    SeComponent.create_translation_table! :name => :string, :unit => :string
  end

  def self.down
    SeComponent.drop_translation_table!
  end
end
