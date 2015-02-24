class AddTranslationsToIndicators < ActiveRecord::Migration
 def self.up
    Indicator.create_translation_table! :name => :string, :unit => :string, :comment => :string
  end

  def self.down
    Indicator.drop_translation_table!
  end
end
