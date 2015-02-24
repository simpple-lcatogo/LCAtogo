class AddNameOtherToConsumptionUse < ActiveRecord::Migration
  def self.up
    add_column :consumption_uses, :name_other, :string
  end

  def self.down
    remove_column :consumption_uses, :name_other
  end
end
