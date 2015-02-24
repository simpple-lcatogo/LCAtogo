class AddChargesToStConsumableDatas < ActiveRecord::Migration
  def self.up
    add_column :st_consumable_datas, :charges, :float        
  end

  def self.down
    remove_column :st_consumable_datas, :charges
  end
end
