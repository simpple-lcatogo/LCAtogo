class CreateMtDistributionTransportDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_distribution_transport_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_transport_type_id
      t.float :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_distribution_transport_datas
  end
end
