class CreateIndicators < ActiveRecord::Migration
  def self.up
    create_table :indicators do |t|
      t.string :name
      t.string :unit
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :indicators
  end
end
