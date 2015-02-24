class CreateMtSupplierPartDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_supplier_part_datas do |t|
      t.integer :mt_product_id
      t.string :name
      t.integer :mt_transport_type_id
      t.float :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_supplier_part_datas
  end
end
