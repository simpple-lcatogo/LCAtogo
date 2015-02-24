class CreatePcCoatingTypes < ActiveRecord::Migration
  def self.up
    create_table :pc_coating_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_coating_types
  end
end
