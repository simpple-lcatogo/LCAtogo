class CreatePcResultValues < ActiveRecord::Migration
  def self.up
    create_table :pc_result_values do |t|
      t.integer :pc_product_id
      t.integer :indicator_id
      t.float :value_one
      t.float :value_n

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_result_values
  end
end
