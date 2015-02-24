class CreateMtUseMachineSubsystemDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_use_machine_subsystem_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_subsystem_id
      t.float :processing
      t.float :ready
      t.float :standby

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_use_machine_subsystem_datas
  end
end
