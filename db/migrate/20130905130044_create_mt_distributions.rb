class CreateMtDistributions < ActiveRecord::Migration
  def self.up
    create_table :mt_distributions do |t|
      t.integer :mt_product_id
      t.boolean :overland
      t.boolean :overseas
      t.float :packaging

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_distributions
  end
end
