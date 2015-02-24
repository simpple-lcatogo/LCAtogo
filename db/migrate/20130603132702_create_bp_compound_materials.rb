class CreateBpCompoundMaterials < ActiveRecord::Migration
  def self.up
    create_table :bp_compound_materials do |t|
      t.string :name
      t.references :bp_compound_family

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_compound_materials
  end
end
