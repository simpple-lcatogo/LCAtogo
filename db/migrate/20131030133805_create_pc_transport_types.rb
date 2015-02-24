class CreatePcTransportTypes < ActiveRecord::Migration
  def self.up
    create_table :pc_transport_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_transport_types
  end
end
