class CreateStMaterials < ActiveRecord::Migration
  def self.up
    create_table :st_materials do |t|
      t.string :name
      t.string :unit
      t.references :st_family

      t.timestamps
    end
    StMaterial.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_materials
    StMaterial.drop_translation_table!
  end
end
