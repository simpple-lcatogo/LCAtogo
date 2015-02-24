class CreateBpMaterials < ActiveRecord::Migration
  def self.up
    create_table :bp_materials do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_materials
  end
end
