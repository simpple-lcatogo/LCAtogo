class FixBpExcelValues4 < ActiveRecord::Migration
  def self.up
     indicator_1_bp = Indicator.find_by_name("Global Warming")        
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 1.31
     bp_excel_value.save   
     
     indicator_2_bp = Indicator.find_by_name_and_sector("Water Footprint", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_2_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 589.8405581
     bp_excel_value.save   
          
     indicator_3_bp = Indicator.find_by_name_and_sector("Land Use", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_3_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.008468600607
     bp_excel_value.save   
     
     indicator_4_bp = Indicator.find_by_name_and_sector("Cumulative Energy Demand (CED) - non-renewable", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_4_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 19.3
     bp_excel_value.save   
     
     indicator_5_bp = Indicator.find_by_name_and_sector("Cumulative Energy Demand (CED) - renewable", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_5_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.1033795
     bp_excel_value.save   
     
     indicator_6_bp = Indicator.find_by_name_and_sector("Eutrophication", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_6_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.00131448608006562
     bp_excel_value.save   
     
     indicator_7_bp = Indicator.find_by_name_and_sector("Acidification", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_7_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.00578154654846133
     bp_excel_value.save   
     
     indicator_8_bp = Indicator.find_by_name_and_sector("Photochemical Ozone Creation Potential", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_8_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.000220667429132687
     bp_excel_value.save   
     
     indicator_9_bp = Indicator.find_by_name_and_sector("Respiratory Inorganics", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_9_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.00185596435131333
     bp_excel_value.save   
     
    
  end

  def self.down
  end
end
