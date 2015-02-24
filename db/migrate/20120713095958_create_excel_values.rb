class CreateExcelValues < ActiveRecord::Migration
  def self.up
    create_table :excel_values do |t|
      t.integer :indicator_id
      t.string :name
      t.string :family
      t.string :phase
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :excel_values
  end
end
