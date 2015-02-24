class AddUnitToElectronicEconomics < ActiveRecord::Migration
  def self.up
    add_column :electronic_economics, :unit, :string
  end

  def self.down
    remove_column :electronic_economics, :unit
  end

end
