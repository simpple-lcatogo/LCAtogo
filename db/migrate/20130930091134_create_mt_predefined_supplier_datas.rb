class CreateMtPredefinedSupplierDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_predefined_supplier_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_family_id
      t.integer :mt_material_id
      t.float :quantity
      t.integer :mt_transport_type_id
      t.float :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_predefined_supplier_datas
  end
end
