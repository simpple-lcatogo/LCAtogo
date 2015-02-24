class RemoveColumnsFromSeUseProduction < ActiveRecord::Migration
  def self.up
  	remove_column :se_use_productions, :description_1, :description_2, :description_3, :description_4
  	remove_column :se_use_productions, :incidents_with_1, :incidents_with_2, :incidents_with_3, :incidents_with_4
  	remove_column :se_use_productions, :duration_with_1, :duration_with_2, :duration_with_3, :duration_with_4
  	remove_column :se_use_productions, :downtime_with_1, :downtime_with_2, :downtime_with_3, :downtime_with_4
  	remove_column :se_use_productions, :incidents_without_1, :incidents_without_2, :incidents_without_3, :incidents_without_4
  	remove_column :se_use_productions, :duration_without_1, :duration_without_2, :duration_without_3, :duration_without_4
	remove_column :se_use_productions, :downtime_without_1, :downtime_without_2, :downtime_without_3, :downtime_without_4  	
  end

  def self.down
  	add_column :se_use_productions, :description_1, :string
  	add_column :se_use_productions, :description_2, :string
  	add_column :se_use_productions, :description_3, :string
  	add_column :se_use_productions, :description_4, :string

	add_column :se_use_productions, :incidents_with_1, :float
	add_column :se_use_productions, :incidents_with_2, :float
	add_column :se_use_productions, :incidents_with_3, :float
	add_column :se_use_productions, :incidents_with_4, :float

	add_column :se_use_productions, :duration_with_1, :float
	add_column :se_use_productions, :duration_with_2, :float
	add_column :se_use_productions, :duration_with_3, :float
	add_column :se_use_productions, :duration_with_4, :float

	add_column :se_use_productions, :downtime_with_1, :float
	add_column :se_use_productions, :downtime_with_2, :float
	add_column :se_use_productions, :downtime_with_3, :float
	add_column :se_use_productions, :downtime_with_4, :float

	add_column :se_use_productions, :incidents_without_1, :float
	add_column :se_use_productions, :incidents_without_2, :float
	add_column :se_use_productions, :incidents_without_3, :float
	add_column :se_use_productions, :incidents_without_4, :float

	add_column :se_use_productions, :duration_without_1, :float
	add_column :se_use_productions, :duration_without_2, :float
	add_column :se_use_productions, :duration_without_3, :float
	add_column :se_use_productions, :duration_without_4, :float

	add_column :se_use_productions, :downtime_without_1, :float
	add_column :se_use_productions, :downtime_without_2, :float
	add_column :se_use_productions, :downtime_without_3, :float
	add_column :se_use_productions, :downtime_without_4, :float

  end
end
