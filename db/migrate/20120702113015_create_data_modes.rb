class CreateDataModes < ActiveRecord::Migration
  def self.up
    create_table :data_modes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :data_modes
  end
end
