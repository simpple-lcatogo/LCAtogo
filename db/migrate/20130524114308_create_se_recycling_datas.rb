class CreateSeRecyclingDatas < ActiveRecord::Migration
  def self.up
    create_table :se_recycling_datas do |t|
      t.float :with_sensors
      t.float :without_sensors
      t.string :custom_name
      t.float :co2
      t.float :revenue
      t.integer :se_product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :se_recycling_datas
  end
end
