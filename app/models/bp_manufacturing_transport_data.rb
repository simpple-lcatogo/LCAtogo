class BpManufacturingTransportData < ActiveRecord::Base
  belongs_to :bp_product
  belongs_to :bp_mode
  belongs_to :bp_vehicle

  validates :distance, :numericality => true
end
