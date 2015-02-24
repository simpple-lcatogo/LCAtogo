class CreateStPackagingTypes < ActiveRecord::Migration
  def self.up
    create_table :st_packaging_types do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end
    StPackagingType.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_packaging_types
    StPackagingType.drop_translation_table!
  end
end
