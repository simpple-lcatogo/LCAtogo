class FixPcExcelValueHasl < ActiveRecord::Migration
  def self.up
    pc_excel_values = PcExcelValue.all
    pc_excel_values.each do |pc_excel_value|
      if pc_excel_value.name == 'HAL'
         pc_excel_value.name = 'HASL'
         pc_excel_value.save
      end
    end
  end

  def self.down
  end
end
