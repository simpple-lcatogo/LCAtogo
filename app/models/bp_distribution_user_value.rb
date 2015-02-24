class BpDistributionUserValue < ActiveRecord::Base
  belongs_to :bp_product
  belongs_to :bp_distribution_default_value
  
  def variable_name
    return self.bp_distribution_default_value.id
  end
  
  def variable_id
    return self.bp_distribution_default_value.name
  end
  
end
