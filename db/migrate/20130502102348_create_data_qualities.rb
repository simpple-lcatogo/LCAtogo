class CreateDataQualities < ActiveRecord::Migration
  def self.up
    create_table :data_qualities do |t|
      t.integer :product_id
      t.string :materials
      t.string :manufacturing
      t.string :distribution
      t.string :use
      t.string :end_of_life

      t.timestamps
    end
  end

  def self.down
    drop_table :data_qualities
  end
end
