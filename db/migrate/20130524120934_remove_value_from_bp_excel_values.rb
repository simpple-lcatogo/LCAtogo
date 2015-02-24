class RemoveValueFromBpExcelValues < ActiveRecord::Migration
  def self.up
    remove_column :bp_excel_values, :value
  end

  def self.down
    add_column :bp_excel_values, :value, :float
  end
end
