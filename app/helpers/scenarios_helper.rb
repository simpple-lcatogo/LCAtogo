module ScenariosHelper
  
  def calculate_average_technical_lifetime(product)

      if product.scenario
        scenario_use_lifetime = product.scenario.use_lifetime
        scenario_annual_failure = product.scenario.annual_failure
        scenario_repair_likeness = product.scenario.repair_likeness
      end
      if scenario_use_lifetime && scenario_annual_failure && scenario_repair_likeness
        afr = scenario_annual_failure / 100;
        monthly_failure = afr / 12;                            
        aggregated_trash = 0;
        extra_sum = 0;
        for i in 1..(scenario_use_lifetime * 12)
            repair_likeliness = 1-(1/(1+Math.exp(scenario_repair_likeness-(i.to_f/12).to_f)));
            monthly_trash = monthly_failure-repair_likeliness*monthly_failure;
            aggregated_trash += monthly_trash;
            average_technical_lifetime = (1 - aggregated_trash) * i + extra_sum;
            extra_sum += (i * monthly_trash)            
        end
      
        average_technical_lifetime = average_technical_lifetime / 12;    
        return average_technical_lifetime
     else
       return 0 
     end 
  end
  
end