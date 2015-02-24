class CreateStProcessDatas < ActiveRecord::Migration
  def self.up
    create_table :st_process_datas do |t|
      t.integer :st_product_id
      t.integer :st_family_process_id
      t.integer :st_process_id
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :st_process_datas
  end
end
