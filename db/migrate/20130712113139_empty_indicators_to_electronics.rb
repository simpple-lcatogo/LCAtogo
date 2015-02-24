class EmptyIndicatorsToElectronics < ActiveRecord::Migration
  def self.up
     Indicator.all.each do |indicator|
       if indicator.sector.blank?
          indicator.sector = 'electronics'
          indicator.save
       end
     end
  end

  def self.down
  end
end
