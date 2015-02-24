class DeleteTableSeRecycling < ActiveRecord::Migration
  def self.up
  	drop_table :se_recyclings
  end

  def self.down
 	 create_table :se_recyclings do |t|
  	 	t.references :se_product
  	 	t.timestamps
  	 end
  end
end
