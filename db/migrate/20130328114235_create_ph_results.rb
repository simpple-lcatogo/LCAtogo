class CreatePhResults < ActiveRecord::Migration
  def self.up
    create_table :ph_results do |t|
      t.integer :ph_product_id
      t.float :lifetime
      t.float :co2_total
      t.float :cabling
      t.float :module
      t.float :framing
      t.float :mounting
      t.float :inverter
      t.float :batteries
      t.float :maintenance

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_results
  end
end
