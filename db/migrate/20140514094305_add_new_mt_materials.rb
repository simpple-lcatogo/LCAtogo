class AddNewMtMaterials < ActiveRecord::Migration
  def self.up
    mt_family_supplier_parts = MtFamily.find_by_name('Supplier parts - Others')
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Foot and housing', :unit => 'kg', :recycling => -22.4222473404255, :incineration => 0.333727393617021, :landfill => 0.198178191489362)
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Worktool holder', :unit => 'kg', :recycling => -23.0408472012103, :incineration => 0.334668683812405, :landfill => 0.199833585476551)
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Worktool spindle', :unit => 'kg', :recycling => -22.8714285714286, :incineration => 0.359258928571429, :landfill => 0.202166666666667)
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Workpiece holder', :unit => 'kg', :recycling => -24.0992907801418, :incineration => 0.337451536643026, :landfill => 0.202520094562648)
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Workpiece spindle', :unit => 'kg', :recycling => -21.36, :incineration => 0.371755555555556, :landfill => 0.200592592592593)
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Oil mist extraction system', :unit => 'kg', :recycling => -66.4, :incineration => 0.6, :landfill => 0.3)
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Hydraulic power train', :unit => 'kg', :recycling => -84.7, :incineration => 0.5, :landfill => 0.3)

    indicator_1_mt = Indicator.find_by_name_and_sector('Cumulative Energy Demand (CED)', 'machine')
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts - Others', :name => 'Foot and housing',  :value => 45.2)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts - Others', :name => 'Worktool holder',  :value => 44.5)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts - Others', :name => 'Worktool spindle',  :value => 47)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts - Others', :name => 'Workpiece holder',  :value => 47.4)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts - Others', :name => 'Workpiece spindle',  :value => 49)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts - Others', :name => 'Oil mist extraction system',  :value => 101)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts - Others', :name => 'Hydraulic power train',  :value => 121)

  end

  def self.down
  end
end
