class CreateStResultValues < ActiveRecord::Migration
  def self.up
    create_table :st_result_values do |t|
      t.integer :st_result_id
      t.float :value
      t.float :value_year
      t.float :percentage
      t.float :percentage_year

      t.timestamps
    end
  end

  def self.down
    drop_table :st_result_values
  end
end
