class AddBpCompoundMaterialToBpCompoundMaterialDatas < ActiveRecord::Migration
  def self.up
    add_column :bp_compound_material_datas, :bp_compound_material_id, :integer
  end

  def self.down
    remove_column :bp_compound_material_datas, :bp_compound_material_id, :integer
  end
end
