class CreateBpResults < ActiveRecord::Migration
  def self.up
    create_table :bp_results do |t|
      t.integer :bp_product_result_id
      t.string :name_en
      t.string :name_ca
      t.string :name_es
      t.integer :parent_id
      t.boolean :check_graphic, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_results
  end
end
