class CreateBpEndOfLifeDatas < ActiveRecord::Migration
  def self.up
    create_table :bp_end_of_life_datas do |t|
      t.references :bp_product
      t.references :bp_end_of_life_default_scenario
      t.float :custom_landfill
      t.float :custom_incineration
      t.float :custom_composting
      t.float :custom_recycling
      t.float :default_transport_distance
      t.float :custom_transport_distance

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_end_of_life_datas
  end
end
