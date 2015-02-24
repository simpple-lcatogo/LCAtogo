class AddNewBpExcelValues < ActiveRecord::Migration
  def self.up
    puts 'u1'
    indicator_1 = Indicator.find_by_name_and_sector("Global Warming", "bio-plastic")
    puts 'u2'
    if indicator_1
      puts 'u3'
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "Flexible PVC compound", indicator_1.id])
      if bp_excel_value
         puts 'check 1'
         bp_excel_value.value = 0.528
         bp_excel_value.save
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "Rigid PVC compound", indicator_1.id])
      if bp_excel_value
         puts 'check 2'
         bp_excel_value.value = 0.528
         bp_excel_value.save        
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "LLDPE", indicator_1.id])
      if bp_excel_value
         puts 'check 3'
         bp_excel_value.value = 0.528
         bp_excel_value.save         
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "HDPE", indicator_1.id])
      if bp_excel_value
         puts 'check 4'
         bp_excel_value.value = 0.528
         bp_excel_value.save         
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "LDPE", indicator_1.id])
      if bp_excel_value
         puts 'check 5'
         bp_excel_value.value = 0.528
         bp_excel_value.save         
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "PP", indicator_1.id])
      if bp_excel_value
         puts 'check 6'
         bp_excel_value.value = 0.528
         bp_excel_value.save         
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "Sugarcane-based LDPE", indicator_1.id])
      if bp_excel_value
         puts 'check 7'
         bp_excel_value.value = 0.528
         bp_excel_value.save         
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "Sugarcane-based HDPE", indicator_1.id])
      if bp_excel_value
         puts 'check 8'
         bp_excel_value.value = 0.528
         bp_excel_value.save         
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "Partially sugarcane-based PET", indicator_1.id])
      if bp_excel_value
         puts 'check 9'
         bp_excel_value.value = 0.528
         bp_excel_value.save         
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Landfill'", "PET", indicator_1.id])
      if bp_excel_value
         puts 'check 10'
         bp_excel_value.value = 0.528
         bp_excel_value.save         
      end
      bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and indicator_id = ? and family = 'Incineration'", "PET", indicator_1.id])
      if bp_excel_value
         puts 'check 11'
         bp_excel_value.value = 1.05
         bp_excel_value.save
         
      end
    end   
    indicators = Indicator.find(:all, :conditions => ["sector='bio-plastic'"])
    indicators.each do |indicator|
#       BpExcelValue.create(:indicator_id => indicator.id, :flow_name => '', :functional_unit => 'kg', :local_name => 'Glue/binder/adhesive', :life_cycle_phase => 'MANUFACTURING', :category => 'RESOURCES', :family => 'Chemical', :value => 0)
    end   
   
  end

  def self.down
  end
end
