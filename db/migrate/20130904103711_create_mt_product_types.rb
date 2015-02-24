class CreateMtProductTypes < ActiveRecord::Migration
  def self.up
    create_table :mt_product_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_product_types
  end
end
