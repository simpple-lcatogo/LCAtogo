class CreateRecyclingDatas < ActiveRecord::Migration
  def self.up
    create_table :recycling_datas do |t|
      t.integer :product_id
      t.integer :material_id
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :recycling_datas
  end
end
