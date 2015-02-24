class AddValueToBpExcelValues < ActiveRecord::Migration
  def self.up
    add_column :bp_excel_values, :value, :decimal, :precision => 30, :scale => 20
  end

  def self.down
    remove_column :bp_excel_values, :value
  end
end
