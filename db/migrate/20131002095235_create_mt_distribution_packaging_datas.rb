class CreateMtDistributionPackagingDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_distribution_packaging_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_material_id
      t.float :quantity
      t.string :scenario

      t.timestamps
    end    
  end

  def self.down
    drop_table :mt_distribution_packaging_datas
  end
end
