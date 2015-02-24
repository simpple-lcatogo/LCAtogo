class CreateStUses < ActiveRecord::Migration
  def self.up
    create_table :st_uses do |t|
      t.integer :st_product_id
      t.float :lifetime

      t.timestamps
    end
  end

  def self.down
    drop_table :st_uses
  end
end
