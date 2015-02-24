class FixBpExcelValues < ActiveRecord::Migration
  def self.up
     indicator_1_bp = Indicator.find_by_name("Global Warming")

     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Recycling, PET, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT')
     bp_excel_value.value = 0.163
     bp_excel_value.save
        
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Recycling, partially bio-based PET, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT')
     bp_excel_value.value = 0.163
     bp_excel_value.save

     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Recycling, surgarcane-based HDPE, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT')
     bp_excel_value.value = 0.163
     bp_excel_value.save

     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Recycling, sugarcane-based LLDPE, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT')
     bp_excel_value.value = 0.163
     bp_excel_value.save

     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Recycling, PP, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT')
     bp_excel_value.value = 0.942
     bp_excel_value.save
     
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Recycling, LDPE, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT')
     bp_excel_value.value = 0.163
     bp_excel_value.save
     
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Recycling, HDPE, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT')
     bp_excel_value.value = 0.163
     bp_excel_value.save
     
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Recycling, LLDPE, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT')
     bp_excel_value.value = 0.163
     bp_excel_value.save
     
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category_and_local_name(indicator_1_bp.id, 'Recycling, PVC, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT','Rigid PVC compound')
     bp_excel_value.value = 0.942
     bp_excel_value.save
     
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category_and_local_name(indicator_1_bp.id, 'Recycling, PVC, GLO S', 'END-OF-LIFE', 'Recycling', 'WASTE TREATMENT', 'Flexible PVC compound')
     bp_excel_value.value = 0.942
     bp_excel_value.save
     
     
     
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_1_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.00000131
     bp_excel_value.save   
     
     indicator_2_bp = Indicator.find_by_name_and_sector("Water Footprint", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_2_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.0005898405581
     bp_excel_value.save   
          
     indicator_3_bp = Indicator.find_by_name_and_sector("Land Use", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_3_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.000000008468600607
     bp_excel_value.save   
     
     indicator_4_bp = Indicator.find_by_name_and_sector("Cumulative Energy Demand (CED) - non-renewable", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_4_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.0000193
     bp_excel_value.save   
     
     indicator_5_bp = Indicator.find_by_name_and_sector("Cumulative Energy Demand (CED) - renewable", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_5_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.0000001033795
     bp_excel_value.save   
     
     indicator_6_bp = Indicator.find_by_name_and_sector("Eutrophication", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_6_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.00000000131448608006562
     bp_excel_value.save   
     
     indicator_7_bp = Indicator.find_by_name_and_sector("Acidification", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_7_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.00000000578154654846133
     bp_excel_value.save   
     
     indicator_8_bp = Indicator.find_by_name_and_sector("Photochemical Ozone Creation Potential", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_8_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.000000000220667429132687
     bp_excel_value.save   
     
     indicator_9_bp = Indicator.find_by_name_and_sector("Respiratory Inorganics", "bio-plastic")
     bp_excel_value = BpExcelValue.find_by_indicator_id_and_flow_name_and_life_cycle_phase_and_family_and_category(indicator_9_bp.id, 'Transport, municipal waste collection, lorry 21t / CH S', 'END-OF-LIFE', 'Road', 'TRANSPORT')
     bp_excel_value.value = 0.00000000185596435131333
     bp_excel_value.save   
     
  end

  def self.down
  end
end
