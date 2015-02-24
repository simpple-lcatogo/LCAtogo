class CreatePhSpecifieds < ActiveRecord::Migration
  def self.up
    create_table :ph_specifieds do |t|
      t.integer :ph_product_id
      t.float :area
      t.integer :area_unit_id
      t.float :power
      t.integer :power_unit_id
      t.float :efficiency
      t.float :lifetime
      t.string :bench_efficiency
      t.string :bench_insolation
      t.string :bench_performance
      t.string :bench_lifetime
      t.integer :ph_module_type_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ph_specifieds
  end
end
