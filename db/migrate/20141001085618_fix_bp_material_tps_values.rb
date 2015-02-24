class FixBpMaterialTpsValues < ActiveRecord::Migration
  def self.up
    bp_excel_values = BpExcelValue.find_all_by_local_name("Starch blend type I")
    bp_excel_values.each do |bp_excel_value|
      bp_excel_value.local_name = 'TPS blend type I (for film applications)'
      bp_excel_value.save
    end

    bp_excel_values = BpExcelValue.find_all_by_local_name("Starch blend type II")
    bp_excel_values.each do |bp_excel_value|
      bp_excel_value.local_name = 'TPS blend type II (for film applications)'
      bp_excel_value.save
    end
  end

  def self.down
  end
end
