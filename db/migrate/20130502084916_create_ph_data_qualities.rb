class CreatePhDataQualities < ActiveRecord::Migration
  def self.up
    create_table :ph_data_qualities do |t|
      t.integer :ph_product_id
      t.string :project_information
      t.string :module_type
      t.string :initial_results
      t.string :electric_components
      t.string :maintenance

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_data_qualities
  end
end
