class AddOrderToSeCountryInfo < ActiveRecord::Migration
  def self.up
    add_column :se_country_infos, :order, :integer
  end

  def self.down
    remove_column :se_country_infos, :order
  end
end
