class CreateMtDataQualities < ActiveRecord::Migration
  def self.up
    create_table :mt_data_qualities do |t|
      t.integer :mt_product_id
      t.string :materials
      t.string :manufacturing
      t.string :distribution
      t.string :use
      t.string :end_of_life

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_data_qualities
  end
end
