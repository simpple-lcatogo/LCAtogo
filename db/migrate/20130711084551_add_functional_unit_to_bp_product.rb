class AddFunctionalUnitToBpProduct < ActiveRecord::Migration
  def self.up
    add_column :bp_products, :functional_unit, :string    
  end

  def self.down
    remove_column :bp_products, :functional_unit
  end
end
