class FixBpExcelValues3 < ActiveRecord::Migration
  def self.up
    bp_excel_values = BpExcelValue.all
    bp_excel_values.each do |bp_excel_value|
       if bp_excel_value.local_name == 'Flexible PVC compound'
          bp_excel_value.local_name = 'Flexible PVC'
          bp_excel_value.save
       end
       if bp_excel_value.local_name == 'Rigid PVC compound'
          bp_excel_value.local_name = 'Rigid PVC'
          bp_excel_value.save
      end
       if bp_excel_value.local_name == 'Flexible PVC compund'
          bp_excel_value.local_name = 'Flexible PVC'
          bp_excel_value.save
       end
       if bp_excel_value.local_name == 'Rigid PVC compund'
          bp_excel_value.local_name = 'Rigid PVC'
          bp_excel_value.save
       end
      
    end    
  end

  def self.down
  end
end
