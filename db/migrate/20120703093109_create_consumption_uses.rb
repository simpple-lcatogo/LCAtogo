class CreateConsumptionUses < ActiveRecord::Migration
  def self.up
    create_table :consumption_uses do |t|
      t.integer :energy_mode_id
      t.integer :family_id
      t.integer :energy_type_id
      t.float :consumption
      t.float :time_mode
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :consumption_uses
  end
end
