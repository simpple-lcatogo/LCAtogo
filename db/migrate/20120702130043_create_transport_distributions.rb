class CreateTransportDistributions < ActiveRecord::Migration
  def self.up
    create_table :transport_distributions do |t|
      t.integer :data_mode_id
      t.integer :vehicle_id
      t.float :quantity
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transport_distributions
  end
end
