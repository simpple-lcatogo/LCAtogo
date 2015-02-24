class AddMtFamilyOther < ActiveRecord::Migration
  def self.up
  #  indicator_mt = Indicator.find_by_sector("machine")
  #  ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS', :family => 'Other', :name => 'Sand',  :value => 0.33)
    family_other = MtFamily.create(:name => 'Other')    
    MtMaterial.create(:mt_family_id => family_other.id, :name => 'Sand', :unit => 'kg', :general => false, :recycling => 0, :incineration => 0, :landfill => 0.20)    
  end

  def self.down
  end
end
