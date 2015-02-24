class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :product_result_id
      t.string :name_en
      t.string :name_ca
      t.string :name_es
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
