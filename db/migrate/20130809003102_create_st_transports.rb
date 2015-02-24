class CreateStTransports < ActiveRecord::Migration
  def self.up
    create_table :st_transports do |t|
      t.string :name
      t.string :unit
      t.references :st_family_transport

      t.timestamps
    end
    StTransport.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_transports
    StTransport.drop_translation_table!
  end
end
