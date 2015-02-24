class CreatePhMaintenances < ActiveRecord::Migration
  def self.up
    create_table :ph_maintenances do |t|
      t.integer :ph_product_id
      t.string :maintenance_needs
      t.string :replacement_inverters
      t.string :replacement_batteries
      t.string :cleaning_modules
      t.float :yearly_frequency
      t.float :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_maintenances
  end
end
