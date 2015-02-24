class AddTextFieldToMtUseMachineSubsystemDatas < ActiveRecord::Migration
  def self.up
    add_column :mt_use_machine_subsystem_datas, :subsystem_name, :string
  end

  def self.down
    remove_column :mt_use_machine_subsystem_datas, :subsystem_name
  end
end
