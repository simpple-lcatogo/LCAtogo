class CreateMtResultValues < ActiveRecord::Migration
  def self.up
    create_table :mt_result_values do |t|
      t.integer :mt_result_id
      t.integer :indicator_id
      t.float :value
      t.float :percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_result_values
  end
end
