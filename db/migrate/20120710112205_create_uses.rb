class CreateUses < ActiveRecord::Migration
  def self.up
    create_table :uses do |t|
      t.float :working
      t.float :lifetime
      t.integer :product_id

      t.timestamps
    end    
  end

  def self.down
    drop_table :uses
  end
end
