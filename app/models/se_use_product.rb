class SeUseProduct < ActiveRecord::Base
  belongs_to :se_product

  def total_anual_output(type)
  	use_production = SeUseProduction.find_by_se_product_id(se_product.id)
  	result = 0
    productive_time = use_production.productive_time(type)
  	
  	if type == "with"
  		se_product.se_use_product_datas.each do |product_data|
  			if !output_with.nil? && !product_data.share_with_sensor.nil?
  				#puts productive_time.to_s + "*" + product_data.share_with_sensor.to_s + "*" + output_with.to_s 
  				result += productive_time * product_data.share_with_sensor/100 * output_with
  				#puts result
  			end
  		end	
  	elsif type == "without"
  		se_product.se_use_product_datas.each do |product_data|
  			if !output_without.nil? && !product_data.share_without_sensor.nil?
  				#puts productive_time.to_s + "*" + product_data.share_without_sensor.to_s + "*" + output_without.to_s 
  				result += productive_time * product_data.share_without_sensor/100 * output_without
  				#puts result
  			end
  		end	
  	end
    result
  end


  def self.total_anual_output_cost(se_product,type)
    debug = false
    use_production = SeUseProduction.find_by_se_product_id(se_product.id)
    result = 0
    productive_time = use_production.productive_time(type)

    output_with = se_product.se_use_product.output_with
    output_without = se_product.se_use_product.output_without

    puts "************Total anual output cost***********************" if debug

    if type == "with"
      se_product.se_use_product_datas.each do |product_data|
        if !output_with.nil? && !product_data.share_with_sensor.nil?
          puts productive_time.to_s + " (productive_time) * " + product_data.share_with_sensor.to_s + "/100 (with_sensor) * " + output_with.to_s + " * (output_with)" + product_data.cost.to_s + " (cost)" if debug

          result += productive_time * product_data.share_with_sensor/100 * output_with * product_data.cost

          puts "partial result with: "+ result.to_s if debug
        end
      end
    elsif type == "without"
      se_product.se_use_product_datas.each do |product_data|
        if !output_without.nil? && !product_data.share_without_sensor.nil?
          puts productive_time.to_s + " (productive_time) *" + product_data.share_without_sensor.to_s + "/100 (without_sensor) * " + output_without.to_s + "* (output_with)" + product_data.cost.to_s + " (cost)" if debug
          result += productive_time * product_data.share_without_sensor/100 * output_without * product_data.cost
          puts "partial result without: "+ result.to_s if debug
        end
      end
    end
    #result = result / 100
    puts "************End Total anual output cost***********************" if debug
    result
  end



end
