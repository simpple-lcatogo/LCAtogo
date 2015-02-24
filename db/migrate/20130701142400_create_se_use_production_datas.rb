class CreateSeUseProductionDatas < ActiveRecord::Migration
  def self.up
    create_table :se_use_production_datas do |t|
      t.references :se_product
      t.string :downtime_level_description
      t.float :occurrance_with_sensor
      t.float :avg_duration_with_sensor
      t.float :occurance_without_sensor
      t.float :avg_duration_without_sensor

      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_production_datas
  end
end
