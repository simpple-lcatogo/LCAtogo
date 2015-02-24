class ChangeMtIndicatorName < ActiveRecord::Migration
  def self.up
    indicator_mt = Indicator.find_by_sector("machine")
    if indicator_mt
       indicator_mt.name = 'Cumulative Energy Demand (CED)'
       indicator_mt.save
    end
  end

  def self.down
  end
end
