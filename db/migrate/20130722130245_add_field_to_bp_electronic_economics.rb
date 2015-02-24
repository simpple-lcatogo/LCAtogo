class AddFieldToBpElectronicEconomics < ActiveRecord::Migration
  def self.up
    add_column :bp_electronic_economics, :bp_distribution_default_value_id, :integer
  end

  def self.down
    remove_column :bp_electronic_economics, :bp_distribution_default_value_id
  end  
end
