class CreateBpDistributionUserValues < ActiveRecord::Migration
  def self.up
    create_table :bp_distribution_user_values do |t|
      t.references :bp_product
      t.references :bp_distribution_default_value
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_distribution_user_values
  end
end
