class CreateReuseDatas < ActiveRecord::Migration
  def self.up
    create_table :reuse_datas do |t|
      t.integer :product_id
      t.integer :material_id
      t.float :contained
      t.float :anticipated
      t.float :contained_repair
      t.float :anticipated_repair

      t.timestamps
    end
  end

  def self.down
    drop_table :reuse_datas
  end
end
