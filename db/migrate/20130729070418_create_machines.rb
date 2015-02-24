class CreateMachines < ActiveRecord::Migration
  def self.up
    create_table :machines do |t|
      t.string :name_1
      t.string :name_2
      t.string :labor
      t.string :power
      t.string :energy
      t.string :unit
      t.float :consumption
      t.float :performance
      t.string :source

      t.timestamps
    end
  end

  def self.down
    drop_table :machines
  end
end
