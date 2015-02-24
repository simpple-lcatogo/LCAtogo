class CreateSeMaterials < ActiveRecord::Migration
  def self.up
    create_table :se_materials do |t|
      t.string :name
      t.string :excel_name

      t.timestamps
    end
  end

  def self.down
    drop_table :se_materials
  end
end
