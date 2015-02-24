class CreateMtMaterials < ActiveRecord::Migration
  def self.up
    create_table :mt_materials do |t|
      t.string :name
      t.integer :mt_family_id
      t.string :unit
      t.boolean :general

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_materials
  end
end
