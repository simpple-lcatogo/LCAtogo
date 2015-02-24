class RecreateBpEconomicPhases < ActiveRecord::Migration
  def self.up
   BpElectronicEconomic.delete_all
    BpEconomicalPhase.delete_all    
    BpEconomicalFamily.delete_all        
    BpEconomicalFlow.delete_all    

    bp_economical_phase_0 = BpEconomicalPhase.create(:name => 'Raw materials')  
    bp_economical_family_0_1 = BpEconomicalFamily.create(:name => 'Raw materials', :bp_economical_phase_id => bp_economical_phase_0.id)
    bp_economical_family_0_2 = BpEconomicalFamily.create(:name => 'Compounding materials and master-batch', :bp_economical_phase_id => bp_economical_phase_0.id)    

    bp_economical_phase_1 = BpEconomicalPhase.create(:name => 'Transport')
    
    bp_economical_phase_2 = BpEconomicalPhase.create(:name => 'Processing')
    bp_economical_family_2_1 = BpEconomicalFamily.create(:name => 'Processes', :bp_economical_phase_id => bp_economical_phase_2.id)    
    bp_economical_family_2_2 = BpEconomicalFamily.create(:name => 'Transport', :bp_economical_phase_id => bp_economical_phase_2.id)    
    
    bp_economical_phase_3 = BpEconomicalPhase.create(:name => 'Distribution')
    bp_economical_family_3_1 = BpEconomicalFamily.create(:name => 'Packaging', :bp_economical_phase_id => bp_economical_phase_3.id)    
    bp_economical_family_3_2 = BpEconomicalFamily.create(:name => 'Transport', :bp_economical_phase_id => bp_economical_phase_3.id)    
    
    bp_economical_phase_4 = BpEconomicalPhase.create(:name => 'End-Of-Life')    
    bp_economical_family_4_1 = BpEconomicalFamily.create(:name => 'Landfill', :bp_economical_phase_id => bp_economical_phase_4.id)    
    bp_economical_family_4_2 = BpEconomicalFamily.create(:name => 'Incineration with energy recovery', :bp_economical_phase_id => bp_economical_phase_4.id)
    bp_economical_family_4_3 = BpEconomicalFamily.create(:name => 'Composting', :bp_economical_phase_id => bp_economical_phase_4.id)
    bp_economical_family_4_4 = BpEconomicalFamily.create(:name => 'Recycling', :bp_economical_phase_id => bp_economical_phase_4.id)
    bp_economical_family_4_5 = BpEconomicalFamily.create(:name => 'Transport', :bp_economical_phase_id => bp_economical_phase_4.id)    
    
    
  end

  def self.down
  end
end
