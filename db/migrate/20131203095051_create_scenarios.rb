class CreateScenarios < ActiveRecord::Migration
  def self.up
    create_table :scenarios do |t|
      t.integer :product_id
      t.float :use_lifetime
      t.float :annual_failure
      t.float :repair_likeness
      t.text :hardware_measures
      t.text :software_measures
      t.text :service_measures
      t.text :business_measures

      t.timestamps
    end
  end

  def self.down
    drop_table :scenarios
  end
end
