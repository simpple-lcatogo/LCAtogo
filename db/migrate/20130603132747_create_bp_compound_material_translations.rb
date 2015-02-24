class CreateBpCompoundMaterialTranslations < ActiveRecord::Migration
  def self.up
   	BpCompoundMaterial.create_translation_table! :name => :string
   
  end

  def self.down
   	BpCompoundMaterial.drop_translation_table!
  end
end
