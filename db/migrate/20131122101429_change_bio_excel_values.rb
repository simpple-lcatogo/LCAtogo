class ChangeBioExcelValues < ActiveRecord::Migration
  def self.up
    bp_excel_values = BpExcelValue.find_all_by_local_name("Waste collection lorry")
    indicator_gw = Indicator.find_by_name_and_sector('Global Warming', 'bio-plastic')
    bp_excel_values.each do |bp_excel_value|
      if bp_excel_value.indicator.id != indicator_gw.id
         bp_excel_value.value = 0
         bp_excel_value.save
      end      
    end
  end

  def self.down
  end
end
