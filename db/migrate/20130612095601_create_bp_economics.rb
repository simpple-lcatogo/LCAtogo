class CreateBpEconomics < ActiveRecord::Migration
  def self.up
    create_table :bp_economics do |t|
      t.integer :bp_product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_economics
  end
end
