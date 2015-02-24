class CreatePhElectricComponents < ActiveRecord::Migration
  def self.up
    create_table :ph_electric_components do |t|
      t.integer :ph_product_id
      t.float :inverter_size_1
      t.float :inverter_size_2
      t.float :quantity_1
      t.float :quantity_2
      t.float :lifetime_1
      t.float :lifetime_2
      t.string :include_batteries
      t.integer :ph_battery_type_id
      t.float :capacity_battery
      t.float :separated_battery
      t.float :battery_lifetime

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_electric_components
  end
end
