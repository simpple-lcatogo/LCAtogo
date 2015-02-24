class CreateMtConsumables < ActiveRecord::Migration
  def self.up
    create_table :mt_consumables do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_consumables
  end
end
