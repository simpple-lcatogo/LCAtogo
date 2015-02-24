class CreateBpDistributionDefaultValues < ActiveRecord::Migration
  def self.up
    create_table :bp_distribution_default_values do |t|
      t.string :name
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_distribution_default_values
  end
end
