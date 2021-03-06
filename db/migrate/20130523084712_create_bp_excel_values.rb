class CreateBpExcelValues < ActiveRecord::Migration
  def self.up
    create_table :bp_excel_values do |t|
      t.integer :indicator_id
      t.string :flow_name
      t.string :functional_unit
      t.string :local_name
      t.string :life_cycle_phase
      t.string :category
      t.string :family
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_excel_values
  end
end
