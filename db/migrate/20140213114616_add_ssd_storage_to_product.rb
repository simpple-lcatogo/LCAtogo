class AddSsdStorageToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :ssd_storage, :float
  end

  def self.down
    remove_column :products, :ssd_storage
  end
end
