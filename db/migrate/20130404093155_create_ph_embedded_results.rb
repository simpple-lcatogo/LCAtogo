class CreatePhEmbeddedResults < ActiveRecord::Migration
  def self.up
    create_table :ph_embedded_results do |t|
      t.integer :ph_product_id
      t.float :lifetime_saved
      t.float :embedded_energy_total
      t.float :pe_pv_cabling
      t.float :pe_pv_module
      t.float :pe_pv_framing   
      t.float :pe_pv_mounting
      t.float :pe_inverter
      t.float :pe_batteries
      t.float :pe_maintenance    
      t.float :peak_power
      t.float :lifetime_production
      t.float :averaged_power
      t.float :averaged_consumption    
      t.float :system_emb
      t.float :energy_payback
      t.float :energy_yield
      t.float :emb_co2      
      t.float :estim_co2
      t.float :net_saved_co2
      t.float :temperature_induced      

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_embedded_results
  end
end
