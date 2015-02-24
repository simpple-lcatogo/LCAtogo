class CreatePhDatabaseMaterials < ActiveRecord::Migration
  def self.up
    create_table :ph_database_materials do |t|
      t.string :module
      t.string :target
      t.float :default_value_co2
      t.float :default_value_pe      

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_database_materials
  end
end
