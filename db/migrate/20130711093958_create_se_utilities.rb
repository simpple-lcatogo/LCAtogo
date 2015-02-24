class CreateSeUtilities < ActiveRecord::Migration
  def self.up
    create_table :se_utilities do |t|
      t.string :name
      t.string :unit
      t.string :excel_name

      t.timestamps
    end
  end

  def self.down
    drop_table :se_utilities
  end
end
