class CreateEconomicalFlows < ActiveRecord::Migration
  def self.up
    create_table :economical_flows do |t|
      t.string :name
      t.integer :economical_family_id

      t.timestamps
    end
  end

  def self.down
    drop_table :economical_flows
  end
end
