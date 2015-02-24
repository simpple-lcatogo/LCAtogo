class CreateMtSubsystems < ActiveRecord::Migration
  def self.up
    create_table :mt_subsystems do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_subsystems
  end
end
