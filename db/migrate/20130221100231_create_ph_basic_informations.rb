class CreatePhBasicInformations < ActiveRecord::Migration
  def self.up
    create_table :ph_basic_informations do |t|
      t.integer :ph_product_id
      t.integer :ph_country_info_id
      t.float :radiation, :default => 1000
      t.float :temperature, :default => 25
      t.integer :ph_mounting_type_id
      t.float :performance_ratio, :default => 0.75
      t.string :known
      t.string :known_module_type
      t.string :framed
      t.float :co2_factor
      t.float :conversion_factor, :default => 0.33

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_basic_informations
  end
end
