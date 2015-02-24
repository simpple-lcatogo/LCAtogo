class CreateStResults < ActiveRecord::Migration
  def self.up
    create_table :st_results do |t|
      t.integer :st_product_id
      t.string :name_en
      t.string :name_ca
      t.string :name_es
      t.integer :parent_id
      t.boolean :check_graphic

      t.timestamps
    end
  end

  def self.down
    drop_table :st_results
  end
end
