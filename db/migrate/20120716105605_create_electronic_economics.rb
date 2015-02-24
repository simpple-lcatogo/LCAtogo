class CreateElectronicEconomics < ActiveRecord::Migration
  def self.up
    create_table :electronic_economics do |t|
      t.integer :economical_phase_id
      t.integer :economical_family_id
      t.integer :economical_flow_id
      t.float :quantity
      t.integer :economic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :electronic_economics
  end
end
