class CreateStFamilyTransports < ActiveRecord::Migration
  def self.up
    create_table :st_family_transports do |t|
      t.string :name

      t.timestamps
    end
    StFamilyTransport.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_family_transports
    StFamilyTransport.drop_translation_table!
  end
end
