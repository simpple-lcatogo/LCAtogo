class SeUseProduction < ActiveRecord::Base
  belongs_to :se_product
  belongs_to :se_country_info

  

  def total_downtime (type)
  	result = 0
  	
  	se_product.se_use_production_datas.each do |production_data|
	  	if type == "with"
	  		occurrence = production_data.occurrance_with_sensor
			avg = production_data.avg_duration_with_sensor
		elsif type == "without"	
			occurrence = production_data.occurance_without_sensor
			avg = production_data.avg_duration_without_sensor
	  	else
	  		break
	  	end

	  	if !occurrence.nil? && !avg.nil?  		
  			result +=  occurrence * avg / 60
  		end	
	  end
	  result
  end	

  def productive_time(type)
  	result = 0
    if type == "with"
      td = total_downtime("with")
    elsif type == "without"
      td = total_downtime("without")
    end

    if !td.nil? && !operation_time.nil? && td != 0
      result =  operation_time - td
    end
    result
  end

  def facility_operation_time()
  	result = 0
  	
  	if !maximum_production.nil? && !closing_times.nil?
  		result = maximum_production - closing_times
  	end	
  	result
  end

end
