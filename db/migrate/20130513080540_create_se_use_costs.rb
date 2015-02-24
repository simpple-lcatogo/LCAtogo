class CreateSeUseCosts < ActiveRecord::Migration
  def self.up
    create_table :se_use_costs do |t|
      t.integer :se_product_id
      t.float :machine_fixed
      t.float :machine_variable
      t.float :personnel_with
      t.float :personnel_without
      t.float :maintenance_with
      t.float :maintenance_without
      t.float :spare_parts_with
      t.float :spare_parts_without
      t.float :spare_parts_storage
      t.float :electricity
      t.float :heat
      t.float :gas
      t.float :fuels
      t.float :grease
      t.float :hydraulic
      t.float :organic

      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_costs
  end
end
