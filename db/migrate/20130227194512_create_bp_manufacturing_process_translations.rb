class CreateBpManufacturingProcessTranslations < ActiveRecord::Migration
  def self.up
   BpManufacturingProcess.create_translation_table! :name => :string
  end

  def self.down
    BpManufacturingProcess.drop_translation_table!
  end
end
