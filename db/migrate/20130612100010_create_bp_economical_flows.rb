class CreateBpEconomicalFlows < ActiveRecord::Migration
  def self.up
    create_table :bp_economical_flows do |t|
      t.string :name
      t.integer :bp_economical_family_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_economical_flows
  end
end
