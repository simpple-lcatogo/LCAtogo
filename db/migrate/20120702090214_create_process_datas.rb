class CreateProcessDatas < ActiveRecord::Migration
  def self.up
    create_table :process_datas do |t|
      t.integer :data_module_id
      t.integer :family_id
      t.integer :data_process_id
      t.float :quantity
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :process_datas
  end
end
