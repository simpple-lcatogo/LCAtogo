class CreateRepairUses < ActiveRecord::Migration
  def self.up
    create_table :repair_uses do |t|
      t.integer :family_id
      t.integer :material_id
      t.float :quantity
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :repair_uses
  end
end
