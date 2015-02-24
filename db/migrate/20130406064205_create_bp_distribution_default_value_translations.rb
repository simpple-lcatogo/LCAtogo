class CreateBpDistributionDefaultValueTranslations < ActiveRecord::Migration
  def self.up
    BpDistributionDefaultValue.create_translation_table! :name => :string
  end

  def self.down
    BpDistributionDefaultValue.drop_translation_table!
  end
end
