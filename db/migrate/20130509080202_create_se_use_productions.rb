class CreateSeUseProductions < ActiveRecord::Migration
  def self.up
    create_table :se_use_productions do |t|
      t.integer :se_country_info_id
      t.float :maximum_production
      t.float :closing_times
      t.float :operation_time
      t.string :description_1
      t.string :description_2
      t.string :description_3
      t.string :description_4
      t.float :incidents_with_1
      t.float :incidents_with_2
      t.float :incidents_with_3
      t.float :incidents_with_4
      t.float :duration_with_1
      t.float :duration_with_2
      t.float :duration_with_3
      t.float :duration_with_4
      t.float :downtime_with_1
      t.float :downtime_with_2
      t.float :downtime_with_3
      t.float :downtime_with_4
      t.float :incidents_without_1
      t.float :incidents_without_2
      t.float :incidents_without_3
      t.float :incidents_without_4
      t.float :duration_without_1
      t.float :duration_without_2
      t.float :duration_without_3
      t.float :duration_without_4
      t.float :downtime_without_1
      t.float :downtime_without_2
      t.float :downtime_without_3
      t.float :downtime_without_4
      
      t.integer :se_product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_productions
  end
end
