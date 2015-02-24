class CreateBpUnits < ActiveRecord::Migration
  def self.up
    create_table :bp_units do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_units
  end
end
