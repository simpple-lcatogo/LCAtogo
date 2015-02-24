class CreateBpPackagingDatas < ActiveRecord::Migration
  def self.up
    create_table :bp_packaging_datas do |t|
      t.integer :bp_product_id
      t.float :amount
      t.integer :bp_distribution_default_value_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_packaging_datas
  end
end
