class CreateBpMaterialTranslations < ActiveRecord::Migration
  def self.up
  	BpMaterial.create_translation_table! :name => :string
  end

  def self.down
    BpMaterial.drop_translation_table!
  end
end
