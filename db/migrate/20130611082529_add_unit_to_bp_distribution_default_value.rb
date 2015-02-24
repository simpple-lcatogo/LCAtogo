class AddUnitToBpDistributionDefaultValue < ActiveRecord::Migration
  def self.up
    drop_table :bp_distribution_default_values
    create_table :bp_distribution_default_values do |t|
      t.string :name
      t.string :unit      
      t.float :value

      t.timestamps
    end    
  end

  def self.down
  end
end
