class CreateSeComponents < ActiveRecord::Migration
  def self.up
    create_table :se_components do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :se_components
  end
end
