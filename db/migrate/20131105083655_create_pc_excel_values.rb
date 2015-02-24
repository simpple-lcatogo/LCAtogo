class CreatePcExcelValues < ActiveRecord::Migration
  def self.up
    create_table :pc_excel_values do |t|
      t.integer :indicator_id
      t.string :name
      t.string :lifecycle
      t.string :category
      t.string :family
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_excel_values
  end
end
