class RemoveBpMaterialFromBpCompoundMaterialDatas < ActiveRecord::Migration
  def self.up
    remove_column :bp_compound_material_datas, :bp_material_id
  end

  def self.down
    add_column :bp_compound_material_datas, :bp_material_id, :integer
  end
end
