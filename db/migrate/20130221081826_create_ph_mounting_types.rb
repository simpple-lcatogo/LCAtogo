class CreatePhMountingTypes < ActiveRecord::Migration
  def self.up
    create_table :ph_mounting_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_mounting_types
  end
end
