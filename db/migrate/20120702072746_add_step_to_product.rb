class AddStepToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :step, :integer
  end

  def self.down
    remove_column :products, :step
  end
end
