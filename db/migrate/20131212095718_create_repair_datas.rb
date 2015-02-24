class CreateRepairDatas < ActiveRecord::Migration
  def self.up
    create_table :repair_datas do |t|
      t.float :quantity
      t.float :upgrade_year
      t.float :overheads_cut_offs
      t.integer :manufacturing_data_id

      t.timestamps
    end
  end

  def self.down
    drop_table :repair_datas
  end
end
