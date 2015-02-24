class CreateMtEndOfLives < ActiveRecord::Migration
  def self.up
    create_table :mt_end_of_lives do |t|
      t.integer :mt_product_id
      t.string :waste_streams

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_end_of_lives
  end
end
