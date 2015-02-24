class CreateSeConsumables < ActiveRecord::Migration
  def self.up
    create_table :se_consumables do |t|
      t.string :name
      t.string :excel_name

      t.timestamps
    end
  end

  def self.down
    drop_table :se_consumables
  end
end
