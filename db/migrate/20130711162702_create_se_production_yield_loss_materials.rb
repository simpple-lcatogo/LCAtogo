class CreateSeProductionYieldLossMaterials < ActiveRecord::Migration
  def self.up
    create_table :se_production_yield_loss_materials do |t|
      t.string :name
      t.string :action
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :se_production_yield_loss_materials
  end
end
