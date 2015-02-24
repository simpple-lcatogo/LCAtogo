class CreateSeDataQualities < ActiveRecord::Migration
  def self.up
    create_table :se_data_qualities do |t|
      t.integer :se_product_id
      t.string :life_cycle
      t.string :energy_usage
      t.string :consumables_usage
      t.string :utilities_usage
      t.string :yield_loss

      t.timestamps
    end
  end

  def self.down
    drop_table :se_data_qualities
  end
end
