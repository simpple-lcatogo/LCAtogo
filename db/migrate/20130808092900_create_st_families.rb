class CreateStFamilies < ActiveRecord::Migration
  def self.up
    create_table :st_families do |t|
      t.string :name

      t.timestamps
    end
    StFamily.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_families
    StFamily.drop_translation_table!
  end
end
