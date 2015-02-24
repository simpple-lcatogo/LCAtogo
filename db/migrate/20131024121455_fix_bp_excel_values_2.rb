class FixBpExcelValues2 < ActiveRecord::Migration
  def self.up
    bp_excel_values = BpExcelValue.find_all_by_category("WASTE TREATMENT")
    bp_excel_values.each do |bp_excel_value|
       if bp_excel_value.local_name == 'Partially sugarcane-based PET'
          bp_excel_value.local_name = 'Partially bio-based PET'
          bp_excel_value.save
       end
       if bp_excel_value.local_name == 'Recycling sugarcane-based LDPE'
          bp_excel_value.local_name = 'Sugarcane-based LDPE'
          bp_excel_value.save
       end
       if bp_excel_value.local_name == 'Potato-based fermented starch plastic'
          bp_excel_value.local_name = 'Potato starch-based plastic'
          bp_excel_value.save
       end
       if bp_excel_value.local_name == 'PHB'
          bp_excel_value.local_name = 'PHB from sugarcane'
          bp_excel_value.save
       end
       if bp_excel_value.local_name == 'PBS'
          bp_excel_value.local_name = 'Partially bio-based PBS'
          bp_excel_value.save
       end
      
    end
  end

  def self.down
  end
end
