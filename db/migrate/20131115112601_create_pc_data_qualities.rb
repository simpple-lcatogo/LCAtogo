class CreatePcDataQualities < ActiveRecord::Migration
  def self.up
    create_table :pc_data_qualities do |t|
      t.integer :pc_product_id
      t.string :water_consumption
      t.string :electric_consumption
      t.string :heat_consumption
      t.string :sludge
      t.string :ghc_emissions
      t.string :pcbs_production

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_data_qualities
  end
end
