class CreatePhModuleTypes < ActiveRecord::Migration
  def self.up
    create_table :ph_module_types do |t|
      t.string :name
      t.float :efficiency
      t.float :lifetime
      t.float :records

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_module_types
  end
end
