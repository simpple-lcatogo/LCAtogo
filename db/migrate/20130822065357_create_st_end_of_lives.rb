class CreateStEndOfLives < ActiveRecord::Migration
  def self.up
    create_table :st_end_of_lives do |t|
      t.integer :st_product_id
      t.string :repair
      t.float :lifetime
      t.string :selected

      t.timestamps
    end
  end

  def self.down
    drop_table :st_end_of_lives
  end
end
