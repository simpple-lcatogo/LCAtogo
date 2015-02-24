class CreateBpElectronicEconomics < ActiveRecord::Migration
  def self.up
    create_table :bp_electronic_economics do |t|
      t.integer :bp_economical_phase_id
      t.integer :bp_economical_family_id
      t.integer :bp_economical_flow_id
      t.integer :bp_material_id
      t.integer :bp_compound_material_id  
      t.integer :bp_vehicle_id
      t.integer :bp_manufacturing_process_id
      t.integer :bp_distribution_user_value_id
      t.float :quantity
      t.integer :bp_economic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_electronic_economics
  end
end
