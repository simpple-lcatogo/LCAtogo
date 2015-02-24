class CreateResultValues < ActiveRecord::Migration
  def self.up
    create_table :result_values do |t|
      t.integer :result_id
      t.integer :indicator_id
      t.float :value
      t.float :percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :result_values
  end
end
