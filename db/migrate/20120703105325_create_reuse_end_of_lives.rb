class CreateReuseEndOfLives < ActiveRecord::Migration
  def self.up
    create_table :reuse_end_of_lives do |t|
      t.integer :family_id
      t.integer :material_id
      t.float :quantity
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reuse_end_of_lives
  end
end
