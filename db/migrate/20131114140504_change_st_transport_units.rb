class ChangeStTransportUnits < ActiveRecord::Migration
  def self.up
    StTransport.all.each do |st_transport|
       if st_transport.unit == 'm<sup>3</sup>'
         st_transport.unit = 'Liter'
         st_transport.save
       end      
    end
    StTransportData.all.each do |st_transport_data|
       if st_transport_data.st_transport && st_transport_data.st_transport.unit == 'Liter'
         if st_transport_data.eco_cost
           st_transport_data.eco_cost = st_transport_data.eco_cost / 1000
           st_transport_data.save
         end  
       end      
    end       
  end

  def self.down
  end
end