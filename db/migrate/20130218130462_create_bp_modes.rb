class CreateBpModes < ActiveRecord::Migration
  def self.up
    create_table :bp_modes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_modes
  end
end
