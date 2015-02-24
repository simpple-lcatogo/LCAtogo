class AddOtherToSeConsumables < ActiveRecord::Migration
  def self.up
  	SeConsumable.create(:name => 'Other', :excel_name => 'Other')
  end

  def self.down
  	SeConsumable.find_by_name('Other').delete
  end
end
